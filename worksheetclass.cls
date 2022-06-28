% written following https://fr.overleaf.com/learn/latex/Writing_your_own_class

% Indentification

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheets}[2022/04/27 Worksheet LaTeX class]

% Preliminary declarations

\LoadClass[a4paper,10pt]{article}

\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{fullpage} % mise en page
\RequirePackage{titlesec} % permet différent styles de titres
\RequirePackage{fancyhdr} % page headers

\RequirePackage{amsmath,amssymb,amsthm,amsfonts,amstext}%
\RequirePackage{mathrsfs} % commande \mathscr
\RequirePackage{mathtools}
\RequirePackage{thmtools}
\RequirePackage{pifont} % symboles spéciaux supplémentaires
\RequirePackage{latexsym} % liste énorme de symboles
\RequirePackage{bm} % better bold symbols
\RequirePackage{bbm} % \mathbbm{1}
\RequirePackage{nicefrac} % perme de faire des fraction diagonales utilie pour les corps de texte
\RequirePackage{empheq} % permet de faire des systèmes déquation avec acolade et numérotation
\RequirePackage{physics} % ajoute des commandes pratiques pour dérivées, sin, ...
\RequirePackage{tensor} % permet de mieux gérer les indices des tenseurs

\RequirePackage{color}
\RequirePackage{transparent}
\RequirePackage[table]{xcolor}
\RequirePackage{tikz,pgfplots} % logos on titlepage
\RequirePackage{xcolor}
\RequirePackage{tikz-3dplot}
\RequirePackage{tikz-cd}
\RequirePackage{mdframed} % shaded environments 
\RequirePackage{float} % permet de fixer les figures avec [H]
\RequirePackage{graphicx}

\RequirePackage[backend=biber,sorting=none,style=numeric]{biblatex} % bilbiography
\RequirePackage{hyperref} % hyperlinks
\RequirePackage{footnote} % footnotes
\RequirePackage{multirow} % permet de faire des cases  sur plusieurs colonnes
\RequirePackage{esvect} % \vv pour vecteurs
\RequirePackage[normalem]{ulem} % commandes de soulignage, achurage, ... mieux
\RequirePackage[nottoc]{tocbibind}% ajoute l'appendice, ..; à la table des matières
\RequirePackage[titletoc]{appendix}
\RequirePackage[font={it}]{caption}
\RequirePackage{xfrac}
\RequirePackage[procnames]{listings}
\RequirePackage{enumitem} % améliore l'env. enumerate, ...
%\RequirePackage{calrsfs} % very calygraphied mathcal
\RequirePackage{cases}
\RequirePackage{setspace}
\RequirePackage{CJKutf8}
\RequirePackage{framed}
\RequirePackage{makeidx}
\RequirePackage{comment}
\RequirePackage{simplewick} % operator contraction
\RequirePackage{ragged2e} % alignment in titlepage
\RequirePackage{tocloft}
\RequirePackage{parskip} % set parskip to non-zero value and parindent to zero, avoid underfull hbox errors
\RequirePackage{titling}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{todonotes}

% Options

% More declarations

\usetikzlibrary{arrows.meta}

% PACKAGES SETUP ---------------------------------

\setlength{\parindent}{0cm}
%\linespread{1.4}
\addbibresource{bibliography.bib}
\pagestyle{plain}
\definecolor{keywords}{RGB}{255,0,90}
\definecolor{comments}{RGB}{0,0,113}
\definecolor{green}{RGB}{0,150,0}
\definecolor{azure}{rgb}{0.0, 0.5, 1.0}
\setlength{\droptitle}{-2cm}

\numberwithin{equation}{section}

%\setuptodonotes{noline,bordercolor=azure!80,textcolor=black,backgroundcolor=azure!50,size=\tiny}
\setuptodonotes{noline,bordercolor=white,textcolor=red,backgroundcolor=white,size=\small}

% Environements

\theoremstyle{definition}
\newtheorem{theorem}{Theorem}[section]
\newtheorem*{theorem*}{Theorem}
\newtheorem{lemma}{Lemma}[section]
\newtheorem*{lemma*}{Lemma}
\newtheorem{prop}{Proposition}[section]
\newtheorem*{prop*}{Proposition}
\newtheorem{cor}{Corollary}[section]
\newtheorem*{cor*}{Corollary}
\newtheorem{defn}{Definition}[section]
\newtheorem*{defn*}{Definition}
\newtheorem{remark}{Remark}[section]
\newtheorem*{remark*}{Remark}
\newtheorem{examp}{Example}[section]
\newtheorem*{examp*}{Example}
\newtheorem{post}{Postulate}[section]
\newtheorem*{post*}{Postulate}
\definecolor{ExampleColor}{rgb}{0.05,0.4,0.7}
\newtheorem*{@eg}{Example}

\def\@maketitle{%
    \begin{center}
        \begin{tabular}{c}
            {\bfseries\Large Worksheet on}\\[0.6em]
            \setlength{\fboxsep}{2em}\fcolorbox{white}{black!10}{\Huge\textbf{\@title}}\\
            \\[0.5cm]
            Written by {\Large Louan Mol}\\[0.5cm]
            Last update on \today.
        \end{tabular}
        \vspace{0.4em}
    \end{center}
}
\makeatother

\newenvironment{eg}
{\begin{@eg}
    \def\FrameCommand
    {%
        \fboxsep=\FrameSep\fcolorbox{ExampleColor!40!black}{ExampleColor!4}%
    }%
    \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
}
{%
    \endMakeFramed
    \end{@eg}
}
\makeatother
\definecolor{DefinitionColor}{rgb}{0.29,0.5,0.13}
\makeatletter
%\newtheorem*{@result}{Result}
\newenvironment{result}
{
    \def\FrameCommand
    {%
        {\color{DefinitionColor}\vrule width 0.2em}%
        \hspace{0.em}%
        \fboxsep=\FrameSep\colorbox{DefinitionColor!7}%
    }%
    \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
}
{%
    \endMakeFramed
    
}
\makeatother

\definecolor{DefinitionColor2}{rgb}{0.29,0.29,0.29}
\makeatletter
\newtheorem*{@details}{details}
\newenvironment{details}
{
    \def\FrameCommand
    {%
        {\color{DefinitionColor2}\vrule width 0.2em}%
        \hspace{0.em}%
        \fboxsep=\FrameSep\colorbox{DefinitionColor2!7}%
    }%
    \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
}
{%
    \endMakeFramed
    
}
\makeatother

% Page layout

\pagestyle{headings}
\headheight = 12pt
\headsep = 25pt

\pagestyle{fancy}
\fancyhf{}
\lhead{\nouppercase\rightmark}
\rhead{\thepage}

\definecolor{gray75}{gray}{0.75}
\newcommand{\hsp}{\hspace{20pt}}
\newcommand{\hspp}{\hspace{10pt}}
\titleformat{\chapter}[hang]{\Huge\bfseries}{\thechapter\hsp\textcolor{gray75}{|}\hsp}{0pt}{\Huge\bfseries}
\titleformat{\section}[hang]{\Large\bfseries}{\thesection\hspp\textcolor{gray75}{|}\hspp}{0pt}{\Large\bfseries}
\titleformat{\subsection}[hang]{\large\bfseries}{\thesubsection\hspp\textcolor{gray75}{|}\hspp}{0pt}{\large\bfseries}
\titleformat{\subsubsection}[hang]{\normalsize\bfseries}{\thesubsubsection\hspp\textcolor{gray75}{|}\hspp}{0pt}{\normalsize\bfseries}