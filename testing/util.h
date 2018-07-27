#ifndef UTIL_H
#define UTIL_H

// Globals
int height;
int width;

typedef struct rgb
{
    unsigned int r;
    unsigned int g;
    unsigned int b;
} rgb;

typedef struct ycc
{
    unsigned int y;
    unsigned int cb;
    unsigned int cr;
} ycc;


unsigned int clamp(unsigned int in, unsigned int min, unsigned int max)
{
	return in < min ? min : in > max ? max : in;
} 

#endif
