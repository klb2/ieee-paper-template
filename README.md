# IEEE LaTeX Paper Template

This repository contains a LaTeX template for research papers that are going to
be submitted to IEEE journals or conferences.
It is based on the [`IEEEtran` LaTeX
class](http://mirrors.ctan.org/macros/latex/contrib/IEEEtran/IEEEtran_HOWTO.pdf).

Additionally, there is a bash script that helps setting up a new document.

## Usage

### On GitHub
Click on ["Use this template"](https://github.com/new?template_name=ieee-paper-template&template_owner=klb2).

### Local Installation
You can simply copy all the files in the repository and start writing your
document in `main.tex`.

If you want to use the generator script, follow the following steps:

#### 0. Requirements
The following software is required
- Bash
- [jq](https://stedolan.github.io/jq/)
- Git

#### 1. Installation
```bash
# Clone the git repository
git clone https://github.com/klb2/ieee-paper-template.git
# Optional: link script to local bin directory
ln -s $(realpath ieee-paper-template/mkieeepaper.sh) "$HOME/.local/bin/"
```

#### 2. Custom Default Values
You can create a config file with custom values that are used for initializing
the paper.
Create the file `config.json` in `ieee-paper-template/` with the following
content (replace with your values as needed)
```json
{
  "author": "Name of the first Author, \\IEEEmembership{Student Member, IEEE} and Second Author, \\IEEEmembership{Senior Member, IEEE}",
  "affiliation": "Author 1 is with ...",
  "funding": "This work is supported by ..."
}
```

#### 3. Initialize New Paper
```bash
mkieeepaper name-of-the-paper-directory
```
This command will create a new directory `name-of-the-paper-directory` with the
template.
It automatically includes the default information from `config.json` and copies
all necessary files.
Additionally, it initializes a Git repository and makes an initial commit.


## Revisions and Highlighting Changes
Typically, you want to highlight changes that you made when revising the paper
and resubmitting it to a journal.
For this, you can use the `\change{...}` command, which sets its content in the
`change` color, which is defined in [`setup-misc.tex`](setup-misc.tex).

A revised version could therefore look something like the following example:
```latex
This is a sentences, \change{to which we added additional information in the revised version}.

\change{%
The change command accepts paragraphs and floats, e.g., figures.

\begin{figure}
\includegraphics{...}
\caption{We added this figure in the revised version}
\end{figure}
}
```

### Automatically Removing Change Markings
After your paper has been accepted (or if you need to do a second revision),
you need to remove the change markings.
If you used the `\change` command to highlight the changes, you can use the
[`remove_change_markings.sh`](remove_change_markings.sh) script to quickly
remove them from a given TeX file.
Simply call the script with the TeX file as an argument, e.g.,
```bash
bash remove_change_markings.sh main.tex
```


## Additional Information
This template includes various custom commands and definitions:
- [`setup-colors.tex`](setup-colors.tex): Custom colors for color cycles
  which is both color-blind and grayscale friendly. They were proposed by [Paul
  Tol](https://sronpersonalpages.nl/~pault/). Additional information and
  examples can be found in the following blog post:
  [https://klb2.gitlab.io/2021/10/20/plot-colors.html](https://klb2.gitlab.io/2021/10/20/plot-colors.html)
- [`setup-plots.tex`](setup-plots.tex): Custom styles for plots that are
  created using
  [`pgfplots`](http://mirrors.ctan.org/graphics/pgf/contrib/pgfplots/doc/pgfplots.pdf)
- [`setup-math.tex`](setup-math.tex): Custom math commands for commonly used
  functions/notation, e.g., `\abs{x}` for the absolute value of `x`. Additional
  information and examples can be found in the following blog post:
  [https://klb2.gitlab.io/2021/12/07/latex-commands.html](https://klb2.gitlab.io/2021/12/07/latex-commands.html)
- [`setup-misc.tex`](setup-misc.tex): Additional setups and style
  configurations.
