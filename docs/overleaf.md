# Usage at overleaf

<!-- toc -->

- [Automatic setup](#automatic-setup)
- [Manual setup](#manual-setup)

<!-- tocstop -->

## Automatic setup

1. Sign in at overleaf and click on "upload new project"

![upload new project](overleaf-step-1.png)

2. Choose "Upload Zip"

![Uplaod Zip](overleaf-step-2.png)

3. Select <https://github.com/latextemplates/scientific-thesis-template/archive/master.zip> for uploading

![select master.zip for uploading](overleaf-step-3.png)

4. Upload master.zip

![upload master.zip](overleaf-step-4.png)

5. Ignore import error of `.latexmkrc`

![Ignore import errors](overleaf-step-5.png)

6. Choose main file: For English, choose `main-english.tex`. For German, choose `main-german.tex`.

![Choose main file](overleaf-step-6.png)

7. Now you can start working in the main file.

## Manual setup

1. create new overleaf project
2. clone the overleaf project using git
3. copy the files to that directory. Follow the steps at "Download" above
4. delete `.latexmkrc`
5. `git add .`
6. `git commit -m"initial import"`
7. `git push`
