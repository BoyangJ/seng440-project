#ifndef YCC_TO_RGB_H
#define YCC_TO_RGB_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "util.h"

rgb ycc_to_rgb(ycc pixel)
{
    rgb output;
    output.r = (1.164 * (pixel.y - 16)) + (1.596 * (pixel.cr - 128));
    output.g = (1.164 * (pixel.y - 16)) - (0.378 * (pixel.cb - 128)) - (0.813 * (pixel.cr - 128));
    output.b = (1.164 * (pixel.y - 16)) + (2.017 * (pixel.cb - 128));
    return output;
}


void matrix_ycc_to_rgb(ycc **in, rgb **out)
{
    int i, j;

    // do not subsample the Y value; every pixel is converted 
    // the Cb and Cr values are subsampled per 2x2 square
    printf("back to rgb: \n");
    for (i = 0; i < height; ++i)
    {
        for (j = 0; j < width; ++j)
        {
            out[i][j] = ycc_to_rgb(in[i][j]);

            printf("%.1f %.1f %.1f, ", out[i][j].r, out[i][j].g, out[i][j].b);
        }
        printf("\n");
    }
    printf("\n");
}



#endif


