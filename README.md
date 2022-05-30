# IEEE Paper Template

This repository contains a LaTeX template for research papers that are going to
be submitted to IEEE journals or conferences.
It is based on the [`IEEEtran` LaTeX
class](http://mirrors.ctan.org/macros/latex/contrib/IEEEtran/IEEEtran_HOWTO.pdf).

Additionally, there is a bash script that helps setting up a new document.

## Usage
You can simply copy all the files in the repository and start writing your
document in `main.tex`.

If you want to use the generator script, follow the following steps

### 0. Requirements
The following software is required
- Bash
- [jq](https://stedolan.github.io/jq/)
- Git

### 1. Installation
```bash
# Clone the git repository
git clone https://github.com/klb2/ieee-paper-template.git
# Optional: link script to local bin directory
ln -s $(realpath ieee-paper-template/mkieeepaper.sh) "$HOME/.local/bin/"
```

### 2. Custom Default Values
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

### 3. Initialize New Paper
```bash
mkieeepaper name-of-the-paper-directory
```
This command will create a new directory `name-of-the-paper-directory` with the
template.
It automatically includes the default information from `config.json` and copies
all necessary files.
Additionally, it initializes a Git repository and makes an initial commit.
