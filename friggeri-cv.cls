\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{black}{HTML}{000000}
\definecolor{gray}{HTML}{444444}
\definecolor{lightgray}{HTML}{888888}

\definecolor{green}{HTML}{9EBD3A}
\definecolor{orange}{HTML}{E6942E}
\definecolor{purple}{HTML}{A85FE3}
\definecolor{red}{HTML}{E51760}
\definecolor{blue}{HTML}{00A8C0}
\definecolor{brown}{HTML}{AD671F}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Source Sans Pro}
\newfontfamily\thinfont[]{Source Sans Pro Light}
\newfontfamily\headingfont[]{Source Sans Pro Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, SizeFeatures={Size=10}]{Source Sans Pro Light}


%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north) {};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\or%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{black}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

% Command for keywords. The two commented lines are there for debugging. It
% will display the keywords so that I can see them.
\newcommand{\keyword}[1]{
  \par\vspace{.5\parskip}%
  \fontsize{0.1pt}{0pt}\selectfont%
  \thinfont\color{white} #1%
  %\fontsize{10pt}{0pt}\selectfont%
  %\thinfont\color{red} #1%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{longtable}
\RequirePackage{tabu}


\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{longtabu} to \textwidth {@{\extracolsep{\fill}}ll}
}{%
  \end{longtabu}
}
\renewcommand{\bfseries}{\headingfont\color{headingcolor}}
\newcommand{\entryFirstPage}[3]{%
  \parbox[t]{14cm}{%
    \fontsize{10pt}{10pt}
    \textbf{\color{black}#2}%
    \hfill%
    {\addfontfeature{Color=lightgray}\textit{#1}}%
%    {\footnotesize\addfontfeature{Color=gray} #3}%
    #3%
    \vspace{\parsep}%
  }\\}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[3]{%
  \parbox[t]{18.6cm}{%
    \fontsize{10pt}{10pt}
    \textbf{\color{black}#2}%
    \hfill%
    {\addfontfeature{Color=lightgray}\textit{#1}}%
%    {\footnotesize\addfontfeature{Color=gray} #3}%
    #3%
    \vspace{\parsep}%
  }\\}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\interest}[1]{%
  \parbox[t]{18.6cm}{%
    #1%
    \vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{black} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
