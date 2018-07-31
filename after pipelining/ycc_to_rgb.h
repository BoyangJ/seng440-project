#ifndef YCC_TO_RGB_H
#define YCC_TO_RGB_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "util.h"

rgb ycc_to_rgb(ycc pixel)
{
    rgb output;
    output.r = clamp( ((2384 * (pixel.y - 256))>>11) + ((3269 * (pixel.cr - 2048))>>11), 0, 4095);
    output.g = clamp( ((2384 * (pixel.y - 256))>>11) - ((3097 * (pixel.cb - 2048))>>13) - ((3330 * (pixel.cr - 2048))>>12), 0, 4095 );
    output.b = clamp( ((2384 * (pixel.y - 256))>>11) + ((2065 * (pixel.cb - 2048))>>10), 0, 4095 );
    return output;
}


void matrix_ycc_to_rgb(ycc **in, rgb **out)
{
    int i, j;

    // do not subsample the Y value; every pixel is converted 
    // the Cb and Cr values are subsampled per 2x2 square
    for (i = 0; i < height; ++i)
    {
        for (j = 0; j < width; ++j)
        {
            out[i][j] = ycc_to_rgb(in[i][j]);
        }
    }
}



#endif


