/* C program to convert a RGB bitmap to a YCbCr format bitmap.
 * Course: SENG 440
 * University of Victoria
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "rgb_to_ycc.h"
#include "ycc_to_rgb.h"
#include "util.h"

#define READBUFFER 255

int main()
{
    FILE *fp;
    char buf[READBUFFER];
    fp = fopen("test2.rgb", "r");

    // get image width and height
    fscanf(fp, "%d", &width);
    fscanf(fp, "%d", &height);

    int i, j;

    rgb **input;
    ycc **output;

    // Initialization
    input = malloc(height * sizeof *input);
    output = malloc(height * sizeof *output);
    for (i = 0; i < height; ++i)
    {
        input[i] = malloc(width * sizeof *input[i]);
        output[i] = malloc(width * sizeof *output[i]);
    }

    for (i = 0; i < height; ++i)
    {
        for (j = 0; j < width; ++j)
        {
            fscanf(fp, "%f %f %f", &input[i][j].r, &input[i][j].g, &input[i][j].b);
        }
    }
    fclose(fp);

    matrix_rgb_to_ycc(input, output);

    fp = fopen("out.ycc", "w");
    for (i = 0; i < height; ++i)
    {
        for (j = 0; j < width; ++j)
        {
            fprintf(fp, "%.0f %.0f %.0f\n", output[i][j].y, output[i][j].cb, output[i][j].cr);
        }
    }
    fclose(fp);


/* rgb -> ycc -> back to original rgb */
    rgb **original;
    original = malloc(height * sizeof *original);
    for (i = 0; i < height; ++i)
    {
        original[i] = malloc(width * sizeof *original[i]);
    }
    matrix_ycc_to_rgb(output, original);

    fp = fopen("orig.rgb", "w");
    for (i = 0; i < height; ++i)
    {
        for (j = 0; j < width; ++j)
        {
            fprintf(fp, "%.0f %.0f %.0f\n", original[i][j].r, original[i][j].g, original[i][j].b);
        }
    }
    fclose(fp);

    // free arrays
    for (i=0; i<height; i++)
    {
        free(input[i]);
        free(output[i]);
        free(original[i]);
    }
    free(input);
    free(output);
    free(original);
}
