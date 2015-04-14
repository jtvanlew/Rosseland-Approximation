# Rosseland Approximation - Code and Applicability
Comparison of exact and Rosseland approximations for non-scattering radiative transfer equation for one-dimensional, parallel plates

This was originally done as a project for MAE 231b - Radiation Heat Transfer graduate course at UCLA. The report giving details on the Rosseland Approximation, equation development, and more is found as FinalProject.pdf

See the README.pdf for a discussion of how to use the Sample.m file -- the form of inputs it expects and the outputs it will provide.

## Introduction
In the study of combined conduction and radiation an extremely convenient model is to apply the Rosseland approximation which essentially allows one to treat radiation heat transfer in the same manner as Fourier’s law of heat diffusion. The Rosseland approximation was derived under the considerations of an “optically thick” medium (optical thickness will be explicitly shown later). In this study, we will solve for the temperature profile in one-dimensional medium between infinite, black parallel plates which are held at constant temperature. The solution will be found via considerations of the full radiative transfer equation as well as with application of the Rosseland approximation.

The equations for the radiative transfer equation and Rosseland approximation will be reduced into non-dimensional form and it will be shown that they are both functions of a single dependent variable, N, which we will define as the ratio of conduction to radiation through the medium; and a single independent variable τ the optical depth. The reduction will allow for a straight-forward parametric study between the solutions of the two methods. Through the comparison of the two methods, we can ultimately conclude under what conditions the applicability of the Rosseland approximation is appropriate.
