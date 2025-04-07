
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TemplateLecture}

%%%% PERSONALIZATION %%%%

\newcommand{\mName}{\texttt{\textbackslash{}renewcommand\{\textbackslash{}mName\}\{<Name(s)>\}}}
\newcommand{\Semester}{\texttt{\textbackslash{}renewcommand\{\textbackslash{}Semester\}\{<Semester>\}}}
\newcommand{\LectureName}{\texttt{\textbackslash{}renewcommand\{\textbackslash{}LectureName\}\{<Lecture>\}}}
\newcommand{\ProfName}{\texttt{\textbackslash{}renewcommand\{\textbackslash{}ProfName\}\{<Prof>\}}}


% Options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
	family=Lec,
	prefix=Lec@
}
\DeclareStringOption[none]{doctype}
\DeclareStringOption[none]{pdftitle}

% Pass all options


\DeclareOption{10pt}{\def\Lec@ptsize{10pt}}
\DeclareOption{11pt}{\def\Lec@ptsize{11pt}}
\DeclareOption{12pt}{\def\Lec@ptsize{12pt}}
\DeclareStringOption[ngerman]{language}[ngerman]

\ExecuteOptions{11pt}
\ProcessOptions
\ProcessKeyvalOptions*
\DeclareDefaultOption{\PassOptionsToClass{\Lec@ptsize}{scrartcl}}

% Process all options




\LoadClass[\Lec@ptsize,a4paper,numbers=noenddot,chapterprefix=true]{scrreprt}
\renewcommand\thempfootnote{\arabic{mpfootnote}}

%%%% PACKAGES %%%%

\RequirePackage{acronym}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsthm}
\RequirePackage{aligned-overset}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{booktabs}
\RequirePackage[\Lec@language]{babel}
\RequirePackage{calc}
\RequirePackage{cancel}
% \RequirePackage{color}
\RequirePackage{dsfont}
\RequirePackage{enumerate}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{environ}
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{imakeidx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{listings}
\RequirePackage{lmodern}
\RequirePackage{mathrsfs}
\RequirePackage{mathtools}
\RequirePackage{nicefrac}
\RequirePackage{pifont}
\RequirePackage{pgf,tikz}
\RequirePackage{tikz-cd}
\RequirePackage{pgfplots}
\RequirePackage{qrcode}
\RequirePackage{scrextend}
\RequirePackage[headsepline]{scrlayer-scrpage}
\RequirePackage{selinput}
\RequirePackage{setspace}
\RequirePackage{soul}
\RequirePackage{stmaryrd}
\RequirePackage{tabularx}
\RequirePackage[most]{tcolorbox}
    \tcbuselibrary{theorems}
\RequirePackage{tocloft}

\RequirePackage[
  colorinlistoftodos
  ,prependcaption
  ,textsize=tiny
  ,disable
  ]{todonotes}

\usepackage{xargs}
% \usepackage[pdftex,dvipsnames]{xcolor}
\RequirePackage[normalem]{ulem}
\usetikzlibrary{calc}
\RequirePackage{tkz-euclide}
\RequirePackage[
  %colorlinks=true, 
  urlcolor=black, linkcolor=black]{hyperref}
\RequirePackage{cleveref}
\geometry{a4paper, top=20mm, left=25mm, right=25mm, bottom=20mm, headsep=5mm, footskip=12mm}
% \usetkzobj{all}
\setlist{listparindent=\parindent}

\RequirePackage{footnote}
\BeforeBeginEnvironment{tcolorbox}{\savenotes}
\AfterEndEnvironment{tcolorbox}{\spewnotes}

\RequirePackage{DanielMacros}


%%%% TODO %%%%

\newcommandx{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improvement}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommandx{\thiswillnotshow}[2][1=]{\todo[disable,#1]{#2}}


%%%% LISTS %%%%

% \newcommand{\listofdefs}{List of Definitions}
% \newlistof{Definition}{defi}{\listdefinitions}

% % Reset section numbering between unnumbered chapters
% % https://tex.stackexchange.com/questions/71162/reset-section-numbering-between
% \newcommand{\DefinitionList}[1]
% {%
%     \refstepcounter{Definition}
%     \addcontentsline{defi}{Definition}
%     {\protect\numberline{\theDefinitionList}#1}\par
% }

%%%% LANGUAGE OPTIONS %%%%

\useshorthands{"}
\addto\extrasenglish{\languageshorthands{ngerman}}

\AtBeginDocument{%
    \providecaptionname{ngerman}{\Lec@Notes}{Mitschrift zur Vorlesung}%
    \providecaptionname{ngerman}{\Lec@HeldBy}{gehalten von}%
    \providecaptionname{ngerman}{\Lec@TeXedBy}{ge\TeX{}ed von}%
    \providecaptionname{ngerman}{\Lec@ListOfDefs}{Liste der Definitionen}%
    \providecaptionname{ngerman}{\Lec@ListOfStatements}{Liste der Aussagen}%
    \providecaptionname{ngerman}{\Lec@Lecture}{Vorlesung}%
    \providecaptionname{ngerman}{\Lec@Appendix}{Anhang}%
    \providecaptionname{ngerman}{\Lec@Corrections}{Falls du Anmerkungen/Korrekturen hast, melde dich bei mir (\href{mailto:daniel.emse@uni-bonn.de}{\texttt{daniel.emse@uni-bonn.de}}).}
    \providecaptionname{ngerman}{\Lec@CorrectionsSec}{Anmerkungen und Korrekturen}
    

    \providecaptionname{english}{\Lec@Notes}{Notes for the lecture}%
    \providecaptionname{english}{\Lec@HeldBy}{held by}%
    \providecaptionname{english}{\Lec@TeXedBy}{\TeX{}ed by}%
    \providecaptionname{english}{\Lec@ListOfDefs}{List of definitions}%
    \providecaptionname{english}{\Lec@ListOfStatements}{List of statements}%
    \providecaptionname{english}{\Lec@Lecture}{Lecture}%
    \providecaptionname{english}{\Lec@Appendix}{Appendix}
    \providecaptionname{english}{\Lec@Corrections}{If you have corrections or improvements, contact me via (\href{mailto:s94jmalm@uni-bonn.de}{\texttt{s94jmalm@uni-bonn.de}}).}
    \providecaptionname{english}{\Lec@CorrectionsSec}{Corrections and improvements}
}




%%%% LAYOUT %%%%

\setlength\parindent{0pt}
\setlength\parskip{5pt plus1pt minus1pt}

\AtBeginDocument{
    \begin{titlepage}\pagenumbering{Roman}
      \centering
      \vspace{1cm}
      {\scshape Universität Bonn \par}
      \vspace{5cm}
        {\large \Lec@Notes \par}
        \vspace{.5cm}
      {\huge \textbf{\LectureName{}} \par}
      \vspace{2cm}
        {\large \Lec@HeldBy \par}
        \vspace{.5cm}
      {\huge \textbf{\ProfName{}} \par}
      \vspace{8cm}
        {\large \Lec@TeXedBy \par}
        \vspace{.5cm}
      {\Large \mName{} \par}
        \vfill
        {\large \Semester{} \par}
    \end{titlepage}

    \pagenumbering{roman}
    % \section*{Abkürzungen und Konventionen}
    % \subsection*{Abkürzungen}
    % \begin{acronym}
    %     \acro{VR}[VR]{Vektorraum}
    %     \acro{KVR}[$\IK$-VR]{$\IK$-Vektorraum}
    %     \acro{KE}[KE]{Körpererweiterung}
    %     \acro{GM}[GM]{Gramsche Matrix}
    %     \acro{UR}[UR]{Unterraum}
    %     \acro{lu}[lu]{linear unabhängig}
    %     \acro{ES}[ES]{Erzeugendensystem}
    %     \acro{BLF}[BLF]{Bilinearform}
    %     \acro{Iso}[Iso]{Isomorphismus}
    %     \acro{Endo}[Endo]{Endomorphismus}
    %     \acro{lin}[lin]{linear}
    %     \acro{bilin}[bilin]{bilinear}
    %     \acro{klin}[$k$-lin]{$k$-linear}
    %     \acro{EW}[EW]{Eigenwert}
    %     \acro{EV}[EV]{Eigenvektor}
    %     \acro{ER}[ER]{Eigenraum}
    %     \acro{ONB}[ONB]{Orthonormalbasis}
    % \end{acronym}
    % \subsection*{Konventionen}\addcontentsline{toc}{section}{Abkürzungen und Konventionen}
    % \begin{itemize}
    %     \item $0 \in \IN$
    %     \item $T^0(V) = \IK$
    % \end{itemize}

    \listoftodos
    \subsubsection*{\Lec@CorrectionsSec}
    \Lec@Corrections
     
    \pagebreak
    \tableofcontents
    \pagebreak
    \pagenumbering{arabic}
    \setcounter{chapter}{-1}
    \addcontentsline{toc}{part}{\Lec@Lecture}\part*{\Lec@Lecture}
}


\AtEndDocument{
\pagebreak
\pagenumbering{Alph}
\addcontentsline{toc}{part}{\Lec@Appendix}\part*{\Lec@Appendix}
\addcontentsline{toc}{chapter}{\Lec@ListOfDefs}\tcblistof[\section*]{def}{\Lec@ListOfDefs}
\pagebreak
\addcontentsline{toc}{chapter}{\Lec@ListOfStatements}\tcblistof[\section*]{thm}{\Lec@ListOfStatements}
\pagebreak
\printindex
\end{document}
}

\ifoot{\Semester}
\ohead{\LectureName}
\cfoot{\thepage}
\ihead{\ProfName}
\ofoot{\mName}

% \title{\vspace{-1cm} \einheit}
\author{}
\date{}


\newcommand{\currentLectureDate}{}
\newcommand{\lastLectureDate}{}
\newcounter{lecture}


\makeindex[columns=2, title=Index, intoc]


% %%%% MACROS %%%%

% \DeclarePairedDelimiter\ceil{\lceil}{\rceil}
% \DeclarePairedDelimiter\floor{\lfloor}{\rfloor}

% \newcommand{\IN}{\mathbb{N}}
% \newcommand{\IZ}{\mathbb{Z}}
% \newcommand{\IQ}{\mathbb{Q}}
% \newcommand{\IR}{\mathbb{R}}
% \newcommand{\IC}{\mathbb{C}}
% \newcommand{\ID}{\mathbb{D}}
% \newcommand{\IP}{\mathbb{P}}
% \newcommand{\IK}{\mathbb{K}}
% \newcommand{\IL}{\mathbb{L}}
% \newcommand{\IF}{\mathbb{F}}
% \newcommand{\IV}{\mathbb{V}}
% \newcommand{\IS}{\mathbb{S}}
% \newcommand{\IE}{\mathbb{E}}
% \newcommand{\cL}{\mathcal{L}}
% \newcommand{\cC}{\mathcal{C}}
% \newcommand{\cD}{\mathcal{D}}
% \newcommand{\cE}{\mathcal{E}}
% \newcommand{\cK}{\mathcal{K}}
% \newcommand{\cM}{\mathcal{M}}
% \newcommand{\cS}{\mathcal{S}}
% \newcommand{\cU}{\mathcal{U}}
% \newcommand{\cA}{\mathcal{A}}
% \newcommand{\cP}{\mathcal{P}}
% \newcommand{\cQ}{\mathcal{Q}}
% \newcommand{\cB}{\mathcal{B}}
% \newcommand{\cF}{\mathcal{F}}
% \newcommand{\cO}{\mathcal{O}}
% \newcommand{\mb}[1]{\mathbb{#1}}
% \newcommand{\mc}[1]{\mathcal{#1}}
% \newcommand{\cmark}{\text{\ding{51}}}
% \newcommand{\xmark}{\text{\ding{55}}}
% \newcommand{\ggT}{\mathrm{ggT}}
% \newcommand{\kgV}{\mathrm{kgV}}
% \newcommand{\charac}{\mathrm{char}}
% \newcommand{\set}[1]{\left\lbrace#1\right\rbrace}
% \newcommand{\Span}[1]{\left<#1\right>}
% \newcommand{\Scalar}{\Span{\cdot,\cdot}}
% \newcommand{\BLF}{\mathrm{BLF}}
% \newcommand{\intervalcc}[1]{\left[#1\right]}
% \newcommand{\intervalco}[1]{\left[#1\right)}
% \newcommand{\intervaloc}[1]{\left(#1\right]}
% \newcommand{\intervaloo}[1]{\left(#1\right)}
% \newcommand{\entspr}{\widehat{=}}
% \newcommand{\range}{\mathrm{range}}
% \newcommand{\rd}{\mathrm{rd}}
% \newcommand{\eps}{\mathrm{eps}}
% \newcommand{\enquote}[1]{\glqq{}#1\grqq{}}
% \newcommand{\Mor}{\mathrm{Mor}}
% \newcommand{\Hom}{\mathrm{Hom}}
% \newcommand{\End}{\mathrm{End}}
% \newcommand{\Aut}{\mathrm{Aut}}
% \newcommand{\Abb}{\mathrm{Abb}}
% \newcommand{\Ker}{\mathrm{Ker}}
% \newcommand{\Img}{\mathrm{Im}}
% \newcommand{\bij}{\overset{\sim}{\to}}
% \newcommand{\surj}{\twoheadrightarrow}
% \newcommand{\inj}{\hookrightarrow}
% \newcommand{\iso}{\cong}
% \newcommand{\hmtp}{\simeq}
% \newcommand{\id}{\mathrm{id}}
% \newcommand{\Id}{\mathrm{Id}}
% \newcommand{\rg}{\mathrm{rg}}
% \newcommand{\dist}{\mathrm{dist}}
% \newcommand{\diag}{\mathrm{diag}}
% \newcommand{\Gl}{\mathrm{Gl}}
% \newcommand{\Bij}{\mathrm{Bij}}
% \newcommand{\ord}{\mathrm{ord}}
% \newcommand{\sgn}{\mathrm{sgn}}
% \newcommand{\abs}[1]{\left|#1\right|}
% \newcommand{\norm}[1]{\left\|#1\right\|}
% \newcommand{\transp}[1]{\begin{pmatrix}\begin{smallmatrix}#1\end{smallmatrix}\end{pmatrix}}
% \newcommand{\EV}{\mathrm{EV}}
% \newcommand{\EW}{\mathrm{EW}}
% \newcommand{\idx}{\mathrm{index}}
% \newcommand{\NST}{\mathrm{NST}}
% \newcommand{\tr}{\mathrm{tr}}
% \newcommand{\Unif}{\mathrm{Unif}}
% \newcommand{\Lin}{\mathrm{Lin}}
% \newcommand{\Bin}{\mathrm{Bin}}
% \newcommand{\Pf}{\mathrm{Pf}}
% \newcommand{\Sp}{\mathrm{Sp}}
% \newcommand{\Sl}{\mathrm{Sl}}
% \newcommand{\Var}{\mathrm{Var}}
% \newcommand{\Vol}{\mathrm{Vol}}
% \newcommand{\Sym}{\mathrm{Sym}}
% \newcommand{\1}{\mathds{1}}
% \newcommand{\epi}{\mathrm{epi}}
% \newcommand{\SO}{\mathrm{SO}}
% \newcommand{\SU}{\mathrm{SU}}
% \newcommand{\Ob}{\mathrm{Ob}}
% \newcommand{\Coker}{\mathrm{Coker}}
% \newcommand{\Coim}{\mathrm{Coim}}
% \newcommand{\supp}{\mathrm{supp}}
% \newcommand{\Lip}{\mathrm{Lip}}
% \newcommand{\dd}{~\mathrm{d}}
% \newcommand{\ee}{\mathrm{e}}
% \newcommand{\grad}{\nabla}
% \newcommand{\loc}{\mathrm{loc}}
% \newcommand{\per}{\mathrm{per}}
% \newcommand{\Rea}{\mathrm{Re}}
% \newcommand{\pt}{\mathrm{pt}}
% \newcommand{\pr}{\mathrm{pr}}
% \newcommand{\const}{\mathrm{const}}
% \newcommand{\incl}{\mathrm{incl}}
% \newcommand{\proj}{\mathrm{proj}}
% \newcommand{\Set}{\mathbf{Set}}
% \newcommand{\Top}{\mathbf{Top}}
% \newcommand{\HoTop}{\mathbf{HoTop}}
% \newcommand{\Grp}{\mathbf{Grp}}
% \newcommand{\Div}{~|~}

% \newcommand{\subgroup}[2]{\reflectbox{\nicefrac[\reflectbox]{$#2$}{$#1$}}}


% %%Commands from Jan
% \newcommand{\konst}{\mathrm{const}}
% \newcommand{\konj}[1]{\overline{#1}}
% \newcommand{\Ra}{\Rightarrow}
% \newcommand{\Lra}{\Leftrightarrow}

% \newcommand{\newLecture}[1]{%
%     \renewcommand{\lastLectureDate}{\currentLectureDate}
%     \ifnum\thelecture=0
%     \else
%     \hfill [\lastLectureDate, \Lec@Lecture{} \thelecture{}]
%     \fi
%     \addtocounter{lecture}{1}
%     \hrule
%     \renewcommand{\currentLectureDate}{#1}
%     \vspace{-5pt}
%     \hfill [\currentLectureDate, \Lec@Lecture{} \thelecture{}]
% }


% \newcommand{\breakline}[1]{%
%     \begingroup%
%         \par\centering\bfseries%
%         \rule[0.6ex]{1.5cm}{1pt} #1 \rule[0.6ex]{1.5cm}{1pt}\par%
%     \endgroup%
% }

% \renewcommand{\div}{\mathrm{div}}
% \renewcommand{\mid}{~\middle|~}

%%%% THEOREMS %%%%
% \theoremstyle{theorem}
\newtheorem*{lemm}{Lemma}
\newtheorem{lemma}{Lemma}[chapter]
% \theoremstyle{theorem}
% \newtheorem{satz}[lemma]{Satz}
% \theoremstyle{theorem}
\newtheorem{prop}[lemma]{Proposition}
\newtheorem{corollary}[lemma]{Korollar}
\theoremstyle{definition}
\newtheorem{frage}[lemma]{Frage}
\newtheorem*{definition}{Definition}
\newtheorem*{beispiel}{Beispiel}
\newtheorem{bsp}[lemma]{Beispiel}
\newtheorem{aufgabe}{Aufgabe}
\newtheorem{behauptung}[lemma]{Behauptung}
\newtheorem*{bemerkung}{Bemerkung}
\newtheorem{construction}[lemma]{Construction}
\newtheorem{bem}[lemma]{Bemerkung}
\newtheorem{axiom}[lemma]{Axiom}
\newtheorem{example}[lemma]{Example}
\newtheorem{problem}{Aufgabe}
% \theoremstyle{solution} 
\newtheorem{Solution}{Lösung}
\newtheorem{remark}[lemma]{Remark}





\tcbset{
  defstyle/.style={fonttitle=\bfseries\upshape, %fontupper=\slshape,
  colback=blue!5!white,colframe=blue!75!black},
  theostyle/.style={fonttitle=\bfseries\upshape, fontupper=\slshape,
  colback=red!10!white,colframe=red!75!black},
  lemstyle/.style={fonttitle=\bfseries\upshape, fontupper=\slshape,
  colback=green!5,colframe=green!35!black}
  }
  
  
\newtcbtheorem[use counter*=lemma,crefname={lemma}{lemmas}, list inside={thm}]{lem}{Lemma}%
{lemstyle}{lem}
\newtcbtheorem[use counter*=lemma,crefname={definition}{definitions}, list inside={def}]{defi}{Definition}%
{defstyle}{def}
\newtcbtheorem[use counter*=lemma,crefname={theorem}{theorems}, list inside={thm}]{thm}{Satz}%
{theostyle}{thm}



%%%% MISC %%%%

\pgfplotsset{compat=1.15}

\usetikzlibrary{arrows}
\usetikzlibrary{shapes, arrows.meta, positioning}
\SelectInputMappings{
  adieresis={ä},
  germandbls={ß}
}
\usetikzlibrary{cd}
\usetikzlibrary{babel}

\makeatletter
\def\namedlabel#1#2{\begingroup
   \def\@currentlabel{#2}%
   \label{#1}\endgroup
}
\makeatother


\setcounter{MaxMatrixCols}{20}



\numberwithin{equation}{chapter}

\algrenewcommand\algorithmicrequire{\textbf{Input:}}
\algrenewcommand\algorithmicensure{\textbf{Output:}}
% \algnewcommand\algorithmicappend{\textpf{append}}y