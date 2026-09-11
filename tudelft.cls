\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudelft}[TU Delft document class]

% ---------- PASS OPTIONS THROUGH TO article ----------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt,table]{article}

% ---------- PACKAGES ----------
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[a4paper,margin=1in]{geometry}
\RequirePackage{tcolorbox}   % For boxes
\RequirePackage{amsmath, amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
% \RequirePackage{mdframed}
\RequirePackage{float}
\RequirePackage{subcaption}
\RequirePackage{svg}
\RequirePackage{etoolbox} % For unnumbered TOC
\RequirePackage[siunitx]{circuitikz}
\RequirePackage{minted}
\RequirePackage{roboto} % provides Roboto Slab via \fontfamily{RobotoSlab-TLF}

% ---------- ROBOTO SLAB (titlepage & section titles only) ----------
\newcommand{\tudelftfont}{\fontfamily{RobotoSlab-TLF}\fontseries{l}\selectfont}

% ---------- HEADER & FOOTER ----------
% \pagestyle{fancy}
% \fancyhf{}
% \lhead{\textit{\thecourse}}
\cfoot{\thepage}

% ---------- TITLE PAGE: DEGREE & FACULTY ----------
\newcommand{\thedegree}{}
\newcommand{\thefaculty}{}
\newcommand{\degree}[1]{\renewcommand{\thedegree}{#1}}
\newcommand{\faculty}[1]{\renewcommand{\thefaculty}{#1}}

\renewcommand{\@maketitle}{%
  % \newpage
  % \null
  % \vskip 2em%
  \begin{center}%
  \tudelftfont
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    \ifdefempty{\thedegree}{}{{\scriptsize \MakeUppercase{\bfseries\thedegree}\par}\vskip 0.3em}%
    \ifdefempty{\thefaculty}{}{{\scriptsize\bfseries Faculty of {\thefaculty}\par}\vskip 0.3em}%
    \vskip 0.5em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em
}

% ---------- CUSTOM COMMANDS ----------
% Question command
\newcommand{\question}[1]{%
  \vspace{1em}%
  \noindent\textbf{#1.}%
}

% Answer environment
\newenvironment{answer}{
  \begin{tcolorbox}[colback=gray!5,colframe=black!60,title=Answer]
}{
  \end{tcolorbox}
}

\newenvironment{amatrix}[1]{%
	\left[
		\begin{array}{@{}*{#1}{c}|c@{}}
}{%
\end{array}\right]
}

% ---------- SECTION FORMATTING ----------
\titleformat{\section}
  {\tudelftfont\Large\bfseries}
  {\thesection.}{0.5em}{}
\titleformat{\subsection}
  {\tudelftfont\large\mdseries}
  {\thesection.}{0.5em}{}
\titleformat{\subsubsection}
  {\tudelftfont\normalsize\mdseries}
  {\thesection.}{0.5em}{}

% ---------- CIRCUITIKZ SETTINGS -----------
\tikzset{
	R/.append style={color=NavyBlue},
	C/.append style={color=Purple},
	V/.append style={color=Red},
	I/.append style={color=Maroon},
	bcirc/.style={circ, color=black, fill=black}
}
\ctikzset{
	*-*/.style = {bipole nodes={bcirc}{bcirc}},
	-*/.style = {bipole nodes={none}{bcirc}},
	*-/.style = {bipole nodes={bcirc}{none}},
	% bipoles/thickness=3
}

% ---------- MINTED SETTINGS ----------

\endinput
