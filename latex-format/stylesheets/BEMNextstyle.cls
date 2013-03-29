% =====================================================================
% || BEMNext Lab Thesis format - 2013/03/23 - v0.0.2                 ||
% =====================================================================
% based on: MSc thesis format - Structural Design Lab [2008/12/08 v0.1]
%           PhD thesis format - Jeroen Coenders      [2010/08/30 v0.04]
%           and a variety of other pieces of knowledge found on the 
%           internet.
%           If you find some of your code in this stylesheet, please
%           let us know and we will add you to this list.

\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[twoside,10pt]{book}

% Use packages
\usepackage[svgnames]{xcolor}
\usepackage{tikz}
\usepackage{kpfonts}
\usepackage[explicit]{titlesec}
\usepackage{bibentry}
\usepackage{html}
\usepackage{url}
\usepackage[comma]{natbib}
\bibliographystyle{BEMNextstyle}
\renewcommand{\cite}{\citep}
\usepackage[final]{pdfpages}
\usepackage{graphicx}
\usepackage{supertabular}
\usepackage{paralist}
\usepackage{booktabs}
\usepackage{ifthen}
\usepackage{comment}
\usepackage{appendix}
\usepackage{hyperref}
\usepackage{subfig}
\usepackage{listings}

% Global variables
\newboolean{PRINTVERSION}
\newboolean{DEBUG}
\newboolean{WIP}
\newboolean{TODOFLAG}
\newboolean{CROPMARKERS}

% Default flags
\setboolean{PRINTVERSION}{false}
\setboolean{DEBUG}{false}
\setboolean{WIP}{false}
\setboolean{TODOFLAG}{false}
\setboolean{CROPMARKERS}{false}

% Color setup
\definecolor{MyBlue2}{rgb}{0.6,0.6,1.0}
\ifthenelse {\boolean{PRINTVERSION}} {%
		\hypersetup{%
			linkbordercolor={1 1 1}, 
			colorlinks=true, 
			linkcolor={black}, 
			citecolor={black},
			urlcolor={black},
			bookmarksnumbered=true,
			linktoc=all
			}
		\newcommand{\intermezzofillcolor}{WhiteSmoke}
		\newcommand{\intermezzoedgecolor}{black}
		\newcommand{\headerrulercolor}{Gainsboro}
		\newcommand{\headertextcolor}{gray}
	}{
		\hypersetup{%
			linkbordercolor={1 1 1}, 
			colorlinks=true, 
			linkcolor={gray}, 
			citecolor={gray},
			urlcolor={gray},
			bookmarksnumbered=true,
			linktoc=all
			}
		\newcommand{\intermezzofillcolor}{MyBlue2}
		\newcommand{\intermezzoedgecolor}{blue}
		\newcommand{\headerrulercolor}{MyBlue2}
		\newcommand{\headertextcolor}{black}
	}
	
% Auto-referencing
\def\chapterautorefname{Chapter}
\def\sectionautorefname{Section}
\def\subsectionautorefname{Section}
\def\subsubsectionautorefname{Section}
\def\paragraphautorefname{Section}
\def\subparagraphautorefname{Section}
\def\appendixautorefname{Appendix}

\newcommand{\mytitle}{}
\newcommand{\subtitle}{thesis sub title}
\newcommand{\reportstatus}{FINAL}
\newcommand{\statuscomment}{Final version}
\newcommand{\versioncomments}{
Issues to be modified in the next version:\\
\begin{itemize}
\item You can add comments here;
\end{itemize}
}
\newcommand{\theauthor}{Author name}
\newcommand{\theauthorfirstlastname}{Author NAME}
\newcommand{\theauthorofficialname}{Author OFFICIAL NAME}
\newcommand{\authordateofbirth}{Date of birth}
\newcommand{\authorplaceofbirth}{Place of birth}
\newcommand{\committee}{}
\newcommand{\defensedow}{}
\newcommand{\defensedate}{}
\newcommand{\defensetime}{}
\newcommand{\printdate}{\today}
\newcommand{\publicationyear}{}
\newcommand{\publisher}{}
\newcommand{\isbn}{}
\newcommand{\keywords}{}

% set headers and footers
\newcommand{\report}{}
\newcommand{\thedate}{\today}
\newcommand{\thetitle}{\mytitle}
\newcommand{\longtitle}{\mytitle,\\\subtitle}

%Set the correct font
\RequirePackage{mathptmx,amsthm}
\RequirePackage{euscript}
\RequirePackage{fancyhdr}
\SetMathAlphabet\mathcal{normal}{OT1}{pzc}{m}{it}

%Fix for urls in Harvard bibliography
%\renewcommand{\harvardurl}{URL: \url}

% set page geometry
\RequirePackage[vcentering,dvips]{geometry}

%Setting for 17x24cm (PhD dissertation size)
\newcommand{\MyLeftMargin}{20mm}
\newcommand{\MyRightMargin}{30mm}
\ifthenelse {\boolean{PRINTVERSION}} {%
\ifthenelse {\boolean{CROPMARKERS}} {%
	\geometry{papersize={176mm,246mm},twoside,verbose,vmargin={23mm,23mm},hmargin={\MyLeftMargin+3mm,\MyRightMargin+3mm},%
		includeheadfoot,headheight=14.5pt,footskip=40pt,showcrop=true}
}{%
	\geometry{papersize={176mm,246mm},twoside,verbose,vmargin={23mm,23mm},hmargin={\MyLeftMargin+3mm,\MyRightMargin+3mm},%
		includeheadfoot,headheight=14.5pt,footskip=40pt}
}
}{%
	\geometry{papersize={170mm,240mm},twoside,verbose,vmargin={20mm,20mm},hmargin={\MyLeftMargin,\MyRightMargin},%
		includeheadfoot,headheight=14.5pt,footskip=40pt}
}

%Settings for A4 paper
%\geometry{a4paper,verbose,vmargin={25.4mm,25.4mm},hmargin={30mm,30mm},includeheadfoot,headheight=14.5pt,footskip=40pt}

% set font for figures
\RequirePackage{caption3}
\renewcommand{\captionfont}{\itshape}
\renewcommand{\captionlabelfont}{\itshape}

% set table of contents style
\RequirePackage[nottoc,notbib]{tocbibind}
\setcounter{tocdepth}{1}

% set linespacing
\RequirePackage{setspace}
\setstretch{1.1}
\setlength\parindent{0pt}

\newcommand{\appendixlabel}[1]
{
\label{#1}
\hypertarget{#1}
}
\newcommand{\appendixref}[1]
{
\hyperlink{#1}{Appendix~\ref*{#1}}
}

% debug environment
\definecolor{MyGreen}{rgb}{0.95,1.0,0.95}
\makeatletter
\newsavebox{\trashcan}
\newenvironment{debug}{%
		\ifthenelse {\boolean{DEBUG}} {%
			\begin{lrbox}{\@tempboxa}\begin{minipage}{\columnwidth}\color{teal}
		}{\begin{lrbox}{\trashcan}}
   }
   {%
		\ifthenelse {\boolean{DEBUG}} {
			\end{minipage}\end{lrbox}%
			\colorbox{MyGreen}{\usebox{\@tempboxa}}
		}{\end{lrbox}}
	}
\makeatother

% wip environment
\definecolor{MyRed}{rgb}{1.0,0.95,0.95}
\makeatletter
\newenvironment{wipbox}{%
		\ifthenelse {\boolean{WIP}} {%
			\begin{lrbox}{\@tempboxa}\begin{minipage}{\columnwidth}\color{red}
		}{\begin{lrbox}{\trashcan}}
   }
   {%
		\ifthenelse {\boolean{WIP}} {
			\end{minipage}\end{lrbox}%
			\colorbox{MyRed}{\usebox{\@tempboxa}}
		}{\end{lrbox}}
	}
\makeatother
\makeatletter
\newenvironment{wip}{%
		\ifthenelse {\boolean{WIP}} {%
			\color{red}
		}{\begin{lrbox}{\trashcan}}
   }
   {%
		\ifthenelse {\boolean{WIP}} {
		}{\end{lrbox}}
	}
\makeatother
\newcommand{\wipmark}{\begin{wipbox}This section is work-in-progress.\end{wipbox}}

% todo environment
\definecolor{MyBlue}{rgb}{0.95,0.95,1.0}
\makeatletter
\newenvironment{todoitem}{%
		\ifthenelse {\boolean{TODOFLAG}} {%
			\begin{lrbox}{\@tempboxa}\begin{minipage}{\columnwidth}\color{blue}TODO:
		}{\begin{lrbox}{\trashcan}}
   }
   {%
		\ifthenelse {\boolean{TODOFLAG}} {
			\end{minipage}\end{lrbox}%
			\colorbox{MyBlue}{\usebox{\@tempboxa}}
		}{\end{lrbox}}
	}
\makeatother

% Intermezzo environment
\newcounter{intermezzoCounter}
\newcommand{\intermezzo}[3]{
\refstepcounter{intermezzoCounter}
 \begin{center}
 \tikzstyle{mybox}=[draw=\intermezzoedgecolor,fill=\intermezzofillcolor,rectangle,inner sep=7pt]
 \begin{tikzpicture}
  \node [mybox] (box){%
   \begin{minipage}{0.91\textwidth}{%
   {\color{\intermezzoedgecolor}\textbf{#1}\\
	\textit{\textbf{Keywords: }#2}\\\\#3}}
   \end{minipage}
  };
 \end{tikzpicture}
 \end{center}
}
\renewcommand{\theintermezzoCounter}{\Roman{intermezzoCounter}}

\newcommand{\intermezzotypetwo}[2]{
\refstepcounter{intermezzoCounter}
 \begin{center}
 \tikzstyle{mybox}=[draw=\intermezzoedgecolor,fill=\intermezzofillcolor,rectangle,inner sep=7pt]
 \begin{tikzpicture}
  \node [mybox] (box){%
   \begin{minipage}{0.91\textwidth}{%
   {\color{\intermezzoedgecolor}\textbf{#1}\\#2}}
   \end{minipage}
  };
 \end{tikzpicture}
 \end{center}
}

\newcommand{\followingintermezzo}[1]{
\refstepcounter{intermezzoCounter}
 \begin{center}
 \tikzstyle{mybox}=[draw=\intermezzoedgecolor,fill=\intermezzofillcolor,rectangle,inner sep=7pt]
 \begin{tikzpicture}
  \node [mybox] (box){%
   \begin{minipage}{0.91\textwidth}{%
   {\color{\intermezzoedgecolor}#1}}
   \end{minipage}
  };
 \end{tikzpicture}
 \end{center}
}

% Overview ref environment
\newcommand{\overviewref}[1]{
\textit{\autoref{#1}~\nameref{#1}}
}

%\begin{comment}
\newcommand*{\blankpage}{%
\begin{center}This page has been intentionally left blank.\end{center}
%\begin{center} \end{center}
\vspace{\fill}}
\makeatletter
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\blankpage
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother
%\end{comment}

% Chapter page style:
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[R]{\thepage}
  \renewcommand\headrulewidth{0pt}
  \renewcommand\footrulewidth{0pt}
}
\renewcommand{\chaptermark}[1]{%
	\markboth{\chaptername\ \thechapter.\ #1}{}}

% Other page style:
\fancypagestyle{trail}{
	\fancyhf{}
	\renewcommand{\headrule}{{\color{\headerrulercolor}\hrule width\headwidth height\headrulewidth \vskip-\headrulewidth}}
	\renewcommand\headrulewidth{0.4pt}
%	\fancyhead[ER]{\thetitle}
	\fancyhead[ER]{\color{\headertextcolor}\mytitle}
	\fancyhead[OR,EL]{\color{\headertextcolor}\thepage}
	\fancyhead[OL]{\color{\headertextcolor}\nouppercase{\leftmark} }
}
\pagestyle{trail}

% Chapter main page style
%\begin{comment}
\ifthenelse {\boolean{PRINTVERSION}} {%
\newcommand{\extramargin}{3mm}
}{%
\newcommand{\extramargin}{0mm}
}
\newcommand*\chapterlabel{}
\titleformat{\chapter}
  {\gdef\chapterlabel{}
   \normalfont\sffamily\huge\bfseries\scshape}
  {\gdef\chapterlabel{\thechapter\ }}{0pt}
  {\begin{tikzpicture}[remember picture,overlay]
    \node[yshift=-2.7cm-\extramargin] at (current page.north west)
      {\begin{tikzpicture}[remember picture, overlay]
        \draw[fill=LightGrey] (-3mm,0) rectangle
          (\paperwidth+3mm,3cm);
        \node[anchor=east,xshift=.9\paperwidth-\extramargin,rectangle,
              rounded corners=5pt,inner sep=11pt,
              fill=MyBlue2]
			  {\color{white}\chapterlabel#1};
       \end{tikzpicture}
      };
   \end{tikzpicture}
  }
\titlespacing*{\chapter}{0pt}{50pt}{-60pt} 
%\end{comment}
