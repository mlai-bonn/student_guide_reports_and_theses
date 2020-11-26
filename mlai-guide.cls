\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mlai-guide}[2020/09/25 MLAI Student guide]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax 

\LoadClass[a4paper,fleqn,10pt]{article}

\RequirePackage[margin=2.25cm]{geometry}

\let\old@maketitle\@maketitle 
\renewcommand*{\@maketitle}{
	\includegraphics[height=16mm]{gfx/ubn-logo}%
	\includegraphics[height=16mm]{gfx/mlai-logo}%
	\newpage%
	\par\noindent 
	
	\hfill%
	\begin{minipage}[t]{0.4\textwidth}%
		\begin{flushright}%
				\raisebox{-\height}{\includegraphics[height=16mm]{gfx/ubn-logo}}%
				\raisebox{-\height}{\includegraphics[height=16mm]{gfx/mlai-logo}}%
		\end{flushright}
	\end{minipage} \vskip2.5em
	\newpage
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
% \let\oldmaketitle\maketitle 
% \renewcommand{\maketitle}{
% 	\par\begingroup%
% 		\renewcommand{\thefootnote}{%
% 			\@fnsymbol \c@footnote%
% 		}%
% 		\def\@makefnmark {\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
% 		\long\def\@makefntext##1{%
% 			\parindent1em\noindent\hb@xt@1.8em{\hss\@textsuperscript{\normalfont\@thefnmark}}##1%
% 		}
% 		\if@twocolumn\ifnum\col@number=\@ne\@maketitle
			
% }

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