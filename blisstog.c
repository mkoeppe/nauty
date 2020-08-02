/* blisstog.c  version 1.0; B D McKay, Sep 2012. */

#define USAGE "blisstog [-n#:#] [infile]*"

#define HELPTEXT \
" Read files of graphs in Bliss (Dimacs) format and write\n\
  them to stdout in sparse6 format.\n\
\n\
  -n#:#  Specify a range of n values for output\n\
  Input files with name *.gz are ungzipped\n"

/*************************************************************************/

#include <zlib.h>

#include "gtools.h"

#define BUFSIZE 256

typedef struct
{
   int v,w;
} vpair;

static boolean
readblissgraph(gzFile f, sparsegraph *g)
/* Reads a graph from Bliss format into a sparse graph */
{
    int n;
    unsigned long ne,j;
    int haven;
    int i,v,w;
    DYNALLSTAT(vpair,elist,elist_sz);
		char buffer[BUFSIZE];

		memset(buffer,'\0',BUFSIZE);

    haven = 0;
    j = 0;
		while (((gzgets(f,buffer,BUFSIZE)) != NULL) && (strlen(buffer) < (BUFSIZE-1)))
    {
	switch (*buffer)
	{
	case 'c':
	    break;

	case 'p':
	    if (haven)
	    {
		fprintf(stderr,"Duplicate p line\n");
		exit(1);
	    }
	    if (sscanf(buffer,"p edge %d %lu",&n,&ne) != 2)
	    {
		fprintf(stderr,"Bad p line\n");
		return FALSE;
	    }
	    haven = 1;
            DYNALLOC1(vpair,elist,elist_sz,ne,"Alloc vpair");
	    break;

	case 'n':
	    if (!haven)
	    {
                fprintf(stderr,"Missing p line\n");
                return FALSE;
            }
            if (sscanf(buffer,"n %d%d",&w,&v) != 2 || w < 1 || w > n)
            {
                fprintf(stderr,"Bad n line\n");
                return FALSE;
            }
	    break;

	case 'e':
	    if (!haven || j == ne)
	    {
		fprintf(stderr,"Missing p line or too many e lines\n");
		return FALSE;
	    }
	    if (sscanf(buffer,"e %d%d",&v,&w) != 2 || v < 1 || w < 1 || v > n || w > n)
	    {
		fprintf(stderr,"Bad e line\n");
		return FALSE;
	    }
	    elist[j].v = v-1; elist[j].w = w-1;
	    ++j;
	    break;

	default:
	    fprintf(stderr,"Unknown line\n");
	    return FALSE;
	}
    }
	if (errno)
	{
  	fprintf(stderr,"Corrupted data file\n");
    return FALSE;
	}
	else if (strlen(buffer) == (BUFSIZE-1))
	{
  	fprintf(stderr,"Corrupted data line\n");
    return FALSE;
	}

    if (j != ne)
    {
        fprintf(stderr,"Wrong number of e lines\n");
        exit(1);
    }

    SG_ALLOC(*g,n,2*ne,"SG_ALLOC");
    g->nv = n;
    g->nde = 2*ne;

    for (i = 0; i < n; ++i) g->d[i] = 0;
    for (j = 0; j < ne; ++j)
    {
	++(g->d[elist[j].v]);
	++(g->d[elist[j].w]);
    }
    g->v[0] = 0;
    for (i = 1; i < n; ++i) g->v[i] = g->v[i-1] + g->d[i-1];
    for (i = 0; i < n; ++i) g->d[i] = 0;

    for (j = 0; j < ne; ++j)
    {
	v = elist[j].v;
	w = elist[j].w;
        g->e[g->v[v]+(g->d[v])++] = w;
        g->e[g->v[w]+(g->d[w])++] = v;
    }

    return TRUE;
}

/**************************************************************************/

int
main(int argc, char *argv[])
{
		gzFile infile;
    int j,firstarg;
    SG_DECL(g);
    int nmin,nmax;

    HELP; PUTVERSION;

    nmax = -1;
    if (argc >= 2 && argv[1][0] == '-' && argv[1][1] == 'n')
    {
				if (sscanf(argv[1]+2,"%d:%d",&nmin,&nmax) == 2) {}
        else if (sscanf(argv[1]+2,":%d",&nmax) == 1) { nmin = 1; }
        else if (sscanf(argv[1]+2,"%d:",&nmin) == 1) { nmax = NAUTY_INFINITY; }
        else  gt_abort(">E blisstog: bad -n switch\n");
				firstarg = 2;
    }
    else
			firstarg = 1;

	if (argc == firstarg)
	{
		if ((infile = gzdopen(STDIN_FILENO,"r")) == NULL)
		{
			fprintf(stderr,">E Can't open stdin\n");
			gt_abort(NULL);
		}
		else
		{
			if (!readblissgraph(infile,&g))
			{
				fprintf(stderr,">E Bliss error in stdin\n");
				gt_abort(NULL);
			}
			else
				writes6_sg(stdout,&g);
		gzclose(infile);
		}
	}
	else
	{
		for (j = firstarg; j < argc; ++j)
		{
			if ((infile = gzopen(argv[j],"r")) == NULL)
			{
				fprintf(stderr,">E Can't open file %s\n",argv[j]);
				gt_abort(NULL);
			}
			else
			{
				if (!readblissgraph(infile,&g))
				{
					fprintf(stderr,">E Bliss error in file %s\n",argv[j]);
					gt_abort(NULL);
				}
				else if (nmax < 0 || (g.nv >= nmin && g.nv <= nmax))
				{
					sortlists_sg(&g);
					writes6_sg(stdout,&g);
				}
			gzclose(infile);
			}
		}
	}

	exit(0);
}
