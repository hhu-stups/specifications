/*
 * This small machine reproduces bug 308
 * The type of the parameter "param" cannot not be inferred
 * when another machine is seen.
 */
MACHINE main308(param)
CONSTRAINTS
    param : INT
SEES
    seen308
END
