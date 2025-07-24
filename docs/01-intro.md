# Introduction: Getting Familiar with R and RStudio {#intro}


## What is R and RStudio?

**R** is a language and environment for statistical computing, based on the **S** language developed at Bell Labs. It supports both classical and modern statistical analysis and is free to use. A core team and contributors maintain **R** across major operating systems. Visit <http://www.r-project.org> for more information.

We won’t use **R** directly. Instead, we’ll use **RStudio**, a free integrated development environment (IDE) that makes interacting with **R** easier. Think of **R** as the engine and **RStudio** as the dashboard—it helps control and extend R's capabilities, like creating documents, apps, and more.

## Downloading and Installing R

You can use **R** and **RStudio** via the CSUB virtual lab. To install them on your own computer:

1. Go to <https://cran.r-project.org/>.
2. Select your operating system (see Figure 1.1).
3. Click *base*, then download the latest version.
4. Run the installer using default settings.
5. Done!

![Figure 1.1: R download page](ch1figures/Rcran.png){ width=80% }

## Downloading and Installing RStudio

1. Visit <http://www.rstudio.com/products/rstudio/download/> and scroll to "RStudio Desktop" (Figure 1.2).
2. Click "DOWNLOAD" and select your OS version (Figure 1.3).
3. Run the installer using default settings.
4. Done! Launch **RStudio** from your computer.

![Figure 1.2: RStudio download page](ch1figures/RStudioDownload.png){ width=80% }

![Figure 1.3: RStudio Desktop download page](ch1figures/RStudioDownloadVersion.png){ width=80% }

## Layout of RStudio

Open **RStudio**. You’ll see three panes by default (Figure 1.4). A fourth opens when you go to *File > New File > R Script*.

![Figure 1.4: RStudio layout. ](ch1figures/RStudioopen.png){ width=90% }

Panes overview:

- **Top-left**: Script editor (source) for writing reusable R code.
- **Bottom-left**: Console where commands run and output appears.
- **Top-right**: Environment (data in memory) and History (past commands).
- **Bottom-right**: Tabs for Files, Plots, Packages, and Help.

## Expressions and Assignments

Try the following in the console:

- `25 - 5` (expression)
- `h = 25 - 5` (assignment)
- `h`
- `H <- 20`; then `H`


``` r
25 - 5
> [1] 20
H = 25 - 5
H
> [1] 20
h <- 20
h
> [1] 20
```

Key points:

- **R** is case sensitive: `h` $\neq$ `H`.
- Created objects appear in the Environment tab.
- Objects persist only during a session unless saved.
- Use `=` or `<-` for assignment. People tend to  prefer `<-`.
- Object names must start with a letter and can include letters, numbers, or periods (no spaces).
- `#` marks a comment (ignored by R).

To quit, use *File > Quit Session* or type `q()`.

## Running R Code in RStudio

To enter code efficiently:

1. Open a new script (*File > New File > R Script*).
2. Type code (e.g., `h <- 20`).
3. Save it as an `.R` file (e.g., *FirstRsession.R*).
4. Highlight a line and click "Run" to execute it.

![  ](ch1figures/RStudioExe.png){ width=80% }

**Tip**: Save your script regularly.

## A Fancy Calculator

R handles basic math:


``` r
727/163
```



Output:

```[1] 4.4601227 ```

Other examples:


``` r
25 * 10
5 / 2
2 + 2
```

Notes:

- `>` means **R** is ready.
- Spacing doesn’t matter (`5/2` $=$ `5 / 2`), but improves readability.

``` 

## Working with Vectors

Combine values into a vector using `c()`:


``` r
x <- c(1, 0, 2, 0, 3)
x
```

```
## [1] 1 0 2 0 3
```

Calculate mean:


``` r
SumOfx <- 1 + 0 + 2 + 0 + 3
SumOfx / 5
```

```
## [1] 1.2
```

Or use built-in functions:


``` r
sum(x)
```

```
## [1] 6
```

``` r
sum(x) / 5
```

```
## [1] 1.2
```

To compute sum of squares:


``` r
x^2
```

```
## [1] 1 0 4 0 9
```

``` r
xsq <- x^2
sum(xsq)
```

```
## [1] 14
```

To compute variance-like quantity:


``` r
diffofxANDxbar <- x - sum(x) / 5
diffofxANDxbar
```

```
## [1] -0.2 -1.2  0.8 -1.2  1.8
```

``` r
sqdiffofxANDxbar <- diffofxANDxbar^2
sum(sqdiffofxANDxbar) / 4
```

```
## [1] 1.7
```

## Data Types in R

Key types:

- Numeric
- Character (strings)
- Logical (TRUE/FALSE)
- Factor

Examples:


``` r
j <- 10.355
j
```

```
## [1] 10.355
```

``` r
k <- c("hi", "hello")
k
```

```
## [1] "hi"    "hello"
```

``` r
L <- "3.4403"
L
```

```
## [1] "3.4403"
```

``` r
p <- c(TRUE, TRUE, FALSE)
p
```

```
## [1]  TRUE  TRUE FALSE
```

``` r
MaritalStatus <- c("married", "married", "divorced", "single", "single", "widowed", "married")
MaritalStatus
```

```
## [1] "married"  "married"  "divorced" "single"   "single"   "widowed"  "married"
```

``` r
MaritalStatus <- as.factor(MaritalStatus)
MaritalStatus
```

```
## [1] married  married  divorced single   single   widowed  married 
## Levels: divorced married single widowed
```

Vectors can only contain one type. Recognizing data types is more important than creating them.

## Comments in R

Use `#` for comments:


``` r
### Comments are ignored by R!
y = 1 + 3  # Assigns 4 to y
```


``` r
# z = 3 - 7  # Ignored
```

Use comments to clarify code.

## Using R Functions

Use `c()` to create a vector:


``` r
X <- c(1, 0, 2, 0, 3, 1, 0, 1, 2, 0)
X
##  [1] 1 0 2 0 3 1 0 1 2 0
```

Use arrow keys to recall past commands. Built-in functions like `sum()` are common:


``` r
sum(X)
> [1] 10
length(X)
> [1] 10
```

## Loading and Installing Packages

**R** comes with base packages. Some, like `mean()`, are loaded by default. Others, like `boxcox()` from `MASS`, must be loaded manually:


``` r
library(MASS)
```

Install additional packages once using:


``` r
install.packages("openintro")
install.packages("mosaic")
```

Follow prompts (choose USA mirror, allow personal library, update if asked). After installation, load packages in each session using `library(openintro)` or `require(openintro)`.
