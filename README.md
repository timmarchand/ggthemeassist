# ggThemeAssist (timmarchand fork)

A maintained fork of [ggThemeAssist](https://github.com/calligross/ggthemeassist) by Calligross, updated for compatibility with **ggplot2 4.0.0+** and modern versions of RStudio.

## What is ggThemeAssist?

ggThemeAssist is an RStudio Addin that provides a graphical interface for editing `ggplot2` theme elements. Instead of memorizing `theme()` arguments, you can interactively adjust colours, fonts, sizes, and layout, then have the corresponding code inserted directly into your script.

## Installation

Install from GitHub using `remotes`:

``` r
remotes::install_github("timmarchand/ggthemeassist")
```

Or with `pacman`:

``` r
pacman::p_load_gh("timmarchand/ggthemeassist")
```

## Usage

1.  Create a `ggplot2` plot and assign it to an object:

``` r
library(ggplot2)
library(ggThemeAssist)

p <- ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point(size = 3)
```

2.  In your RStudio script, **highlight the plot object name** (`p`) with your mouse
3.  Go to **Addins \> ggplot Theme Assistant**
4.  Adjust theme elements using the graphical interface
5.  Click **Done** — the theme code is inserted into your script automatically

## Important Notes

-   The plot **must be assigned to a variable** (e.g. `p <-`) before using the addin
-   You **must highlight the variable name** in the script editor before launching the addin
-   Launch via the **Addins menu**, not from the console

## What's Changed from the Original

This fork fixes several compatibility issues with modern versions of ggplot2 and RStudio:

-   **ggplot2 4.0.0 compatibility** — theme elements are now S7 objects; updated extraction logic accordingly
-   **Deprecated `size` argument** — replaced with `linewidth` in `element_line()` and `element_rect()` calls throughout
-   **NULL parse errors** — fixed `= NULL` arguments being included in generated theme strings, which caused R parse errors
-   **Subtitle/caption handling** — fixed malformed `element_text()` calls for plot subtitle and caption elements
-   **RStudio script insertion** — fixed `insertText` to reliably target the source editor regardless of focus
-   **Source editor context** — switched to `getSourceEditorContext()` for reliable selection capture

## Original Package

This is a fork of [ggThemeAssist](https://github.com/calligross/ggthemeassist) by Calligross, which is no longer actively maintained. All credit for the original concept and implementation goes to the original author.

## License

GPL-3
