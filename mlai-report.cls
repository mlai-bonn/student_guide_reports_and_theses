\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mlai-report}[2020/09/25 MLAI Report]

\DeclareOption{logo}{\gdef\@uselogo{yes}}
\DeclareOption{nologo}{\global\let\@uselogo\@empty}

\ExecuteOptions{nologo} 

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax 

\LoadClass[a4paper,fleqn,10pt]{article}

\RequirePackage[margin=2.25cm]{geometry}

\RequirePackage{translations}

\DeclareTranslation{English}{course}{Course}
\DeclareTranslation{German}{course}{Kurs}
\DeclareTranslation{English}{courseid}{\GetTranslation{course}-ID}
\DeclareTranslation{German}{courseid}{\GetTranslation{course}-ID}
\DeclareTranslation{English}{session}{Session}
\DeclareTranslation{German}{session}{Session} 
\DeclareTranslation{English}{term}{Term}
\DeclareTranslation{German}{term}{Semester} 
\DeclareTranslation{English}{supervisors}{Supervisor(s)} 
\DeclareTranslation{German}{supervisors}{Betreuer/-in}


\global\let\@needtable\@empty 
\global\let\@courseid\@empty 
\global\let\@course\@empty 
\global\let\@session\@empty
\global\let\@term\@empty 
\global\let\@supervisor\@empty

\newcommand{\course}[3]{
	\def\@needtable{yes}
	\def\@courseid{#1}
	\def\@course{#2}
	\def\@session{#3}
}
\newcommand{\term}[1]{%
	\def\@needtable{yes}%
	\def\@term{#1}%
}
\newcommand{\supervisor}[1]{%
	\def\@needtable{yes}%
	\def\@supervisor{#1}%
}

\let\old@maketitle\@maketitle 
\renewcommand*{\@maketitle}{
	\newpage%
	\par\noindent 
	\begin{minipage}[t]{0.59\textwidth}\par\noindent
		\ifx\@needtable\@empty\null\else
			\scriptsize
			\def\and{ \\ & }
			\renewcommand{\arraystretch}{1.2}
			\begin{tabular}[t]{|l|p{0.675\textwidth}|}\hline 
				\ifx\@courseid\@empty\else 
				\GetTranslation{courseid}: & \@courseid \\
				\hline 
				\fi 
				\ifx\@course\@empty\else 
				\GetTranslation{course}: & \@course \\
				\hline 
				\fi 
				\ifx\@session\@empty\else 
				\GetTranslation{session}: & \@session \\
				\hline 
				\fi 
				\ifx\@term\@empty\else 
				\GetTranslation{term}: & \@term \\
				\hline 
				\fi 
				\ifx\@supervisor\@empty\else 
				\GetTranslation{supervisors}:  & \@supervisor \\			
				\hline 
				\fi 
			\end{tabular}% 
		\fi%
	\end{minipage}	
	\hfill%
	\begin{minipage}[t]{0.4\textwidth}%
		\begin{flushright}%
			\ifx\@uselogo\@empty 
				\null\vskip2em
			\else 
				\raisebox{-\height}{\includegraphics[height=16mm]{gfx/ubn-logo-14}}%
				\raisebox{-\height}{\includegraphics[height=16mm]{gfx/mlai-logo}}%
			\fi
		\end{flushright}
	\end{minipage} \vskip2.5em
	
	\begin{center}
		\let\footnote\thanks 
		{\LARGE \bfseries \@title \par} \vskip1.5em 
		{\large \lineskip.5em
			\begin{tabular}[t]{c}
				\@author
			\end{tabular}\par%
		} \vskip1em
		{\large \@date}\par\vskip1.5em
	\end{center} \par \vskip1.5em 
}
\let\oldmaketitle\maketitle 
\renewcommand{\maketitle}{
	\par\begingroup%
		\renewcommand{\thefootnote}{%
			\@fnsymbol \c@footnote%
		}%
		\def\@makefnmark {\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
		\long\def\@makefntext##1{%
			\parindent1em\noindent\hb@xt@1.8em{\hss\@textsuperscript{\normalfont\@thefnmark}}##1%
		}
		\if@twocolumn\ifnum\col@number=\@ne\@maketitle
			
}

\RequirePackage{xcolor,graphicx,enumitem,booktabs}


\RequirePackage[fleqn,intlimits]{mathtools}
\RequirePackage[amsmath]{ntheorem} 
\theoremstyle{break}
\theorembodyfont{\normalfont}
\theoremseparator{.}
\theorempreskip{1em}
\theorempostskip{1em}
\theoremsymbol{\ensuremath{\diamond}}

\newtheorem{thm}{Theorem}
\newtheorem{lem}[thm]{Lemma}
\newtheorem{prop}[thm]{Proposition}
\newtheorem{cor}[thm]{Corollary}

\newtheorem{exa}[thm]{Example}
\newtheorem{exas}[thm]{Examples}

\newtheorem{probT}[thm]{Problem}
\newtheorem{probsT}[thm]{Problems}

\newtheorem{quest}{Question}
\newtheorem{quests}{Questions}

\newtheorem{rem}[thm]{Remark}
\newtheorem{rems}[thm]{Remarks}

\newtheorem{defn}[thm]{Definition}

\theoremstyle{nonumberplain}
\theoremheaderfont{\itshape}
\theoremsymbol{\rule{1ex}{1ex}}

\newtheorem{proof}{Proof} 

\RequirePackage{iftex}
\ifPDFTeX
\wlog{PDF LaTeX detected}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp,tgpagella} 
\else 
\ifLuaTeX
\wlog{LuaLaTeX detected}
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX]{TeX Gyre Pagella} 
\else 
\ifXeTeX
\wlog{XeLaTeX detected}
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX]{TeX Gyre Pagella} 
\fi 
\fi 
\fi 