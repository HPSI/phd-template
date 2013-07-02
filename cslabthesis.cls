%
% cslabthesis.cls
%
% Class file for theses of the Computing Systems Laboratory, School of ECE,
% NTUA, Greece.
%
% Copyright (C) 2012-2013, Computing Systems Laboratory (CSLab), NTUA.
% Copyright (C) 2012-2013, Vasileios Karakasis
%
% All rights reserved
%
\makeatletter
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cslabthesis}

\newcommand\doc@lang{}
\newcommand\doc@type{}

\DeclareOption{english}{\renewcommand\doc@lang{en}}
\DeclareOption{greek}{\renewcommand\doc@lang{gr}}
\DeclareOption{phdthesis}{\renewcommand\doc@type{phdthesis}}
\DeclareOption{diploma}{\renewcommand\doc@type{diploma}}

% Default options
\ExecuteOptions{english,phdthesis}
\ProcessOptions

\LoadClass[11pt,a4paper,twoside,final,showtrims]{memoir}

\RequirePackage{amsmath}
%\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{mathspec}       % Also includes fontspec
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage{polyglossia}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage[
  labelfont={sf,bf},
  format=hang,
  singlelinecheck,
  textfont=small,
  compatibility=false,
]{caption}

% Use subfig to setup the fonts
\RequirePackage[
  justification=raggedright,
]{subfig}
\RequirePackage{textcase}
\RequirePackage{multirow}
\RequirePackage[square,semicolon]{natbib}
\RequirePackage{xkeyval}
\RequirePackage[bookmarks]{hyperref}

% Set the default fonts
\setmainfont[Mapping=tex-text]{Minion Pro}

% Adjust the secondary fonts to have the same lowercase height
\setsansfont[Mapping=tex-text,Scale=0.9029]{Myriad Pro}

% Quick fix for bug in polyglossia for greek support
% See also: https://github.com/fc7/polyglossia/issues/4
\ifthenelse{\equal{\doc@lang}{gr}}{
  \newfontfamily\greekfont[Script=Greek,Mapping=tex-text]{Minion Pro}
}{}


% Set up the math environment
\setmathsfont(Digits,Latin,Greek){Minion Pro}
\setmathrm{Minion Pro}

%
% Fix punctuation marks in formulas -- mathspec bug
% 
% Fix found here: http://tex.stackexchange.com/questions/38711/punctuation-marks-in-math-mode-in-xetex-mathspec
% 
\DeclareMathSymbol{,}{\mathpunct}{\eu@LatinLowercase@symfont}{`,}
\DeclareMathSymbol{.}{\mathord}{\eu@LatinLowercase@symfont}{`.}
\DeclareMathSymbol{<}{\mathrel}{\eu@LatinLowercase@symfont}{`<}
\DeclareMathSymbol{>}{\mathrel}{\eu@LatinLowercase@symfont}{`>}
\DeclareMathSymbol{/}{\mathord}{\eu@LatinLowercase@symfont}{`/}
\XeTeXDeclareMathSymbol{^^^^2026}{\mathinner}{\eu@LatinLowercase@symfont}{"2026}[\mathellipsis]

\providecommand\theauthorgen{\theauthor}
\providecommand\theauthortitle{}
\providecommand\theinstitution{}
\providecommand\theschool{}
\providecommand\thedivision{}
\providecommand\theexamsday{}
\providecommand\theexamsmonth{}
\providecommand\theexamsyear{}
\providecommand\authorgen[1]{\renewcommand\theauthorgen{#1}}
\providecommand\authortitle[1]{\renewcommand\theauthortitle{#1}}
\providecommand\institution[1]{\renewcommand\theinstitution{#1}}
\providecommand\school[1]{\renewcommand\theschool{#1}}
\providecommand\division[1]{\renewcommand\thedivision{#1}}
\providecommand\examsdate[3]{
  \renewcommand\theexamsday{#1\xspace}
  \renewcommand\theexamsmonth{#2\xspace}
  \renewcommand\theexamsyear{#3\xspace}
}
\providecommand\documentdescr{}
\providecommand\copyrightnotice{}
\newcommand\th@advisorytext{}
\newcommand\th@examiningtext{}
\newcommand\th@authordrtitle{}
\newcommand\th@signatureplaceholder{\rule{5em}{.4pt}}

% Set the document description
\ifthenelse{\equal{\doc@type}{phdthesis}}{
  \ifthenelse{\equal{\doc@lang}{gr}}{
    \renewcommand\documentdescr{Διδακτορική Διατριβή}
    \renewcommand\th@advisorytext{Συμβουλευτική Επιτροπή\xspace}
    \renewcommand\th@examiningtext{Εγκρίθηκε από την επταμελή επιτροπή\xspace}
    \renewcommand\th@authordrtitle{Διδάκτωρ Εθνικού Μετσοβίου Πολυτεχνείου\xspace}
  }{
    \renewcommand\documentdescr{Ph.D.\ Thesis}
    \renewcommand\th@advisorytext{Advisory Committee\xspace}
    \renewcommand\th@examiningtext{Approved by the examining committee\xspace}
    \renewcommand\th@authordrtitle{Ph.D., National Technical University of Athens, Greece.\xspace}
  }
}{}

\ifthenelse{\equal{\doc@type}{diploma}}{
  \ifthenelse{\equal{\doc@lang}{gr}}{
    \renewcommand\documentdescr{Διπλωματική εργασία}
  }{
    \renewcommand\documentdescr{Diploma Thesis}
  }
}{}

% Set the document's default language
\ifthenelse{\equal{\doc@lang}{gr}}{
  \setmainlanguage{greek}
  \setotherlanguages{english}
}{
  \setmainlanguage{english}
  \setotherlanguages{greek}
}

% Set the copyright notice text (currently only in greek)
\renewcommand\copyrightnotice{
  \textgreek{
    \small
    \noindent
    Copyright \textcopyright\ \theauthor, \theexamsyear.\\
    Με επιφύλαξη παντός δικαιώματος. All rights reserved\\
    
    \par\noindent
    Απαγορεύεται η αντιγραφή, αποθήκευση και διανομή της παρούσας εργασίας, εξ
    ολοκλήρου ή τμήματος αυτής, για εμπορικό σκοπό. Επιτρέπεται η ανατύπωση,
    αποθήκευση και διανομή για σκοπό μη κερδοσκοπικό, εκπαιδευτικής ή
    ερευνητικής φύσης, υπό την προϋπόθεση να αναφέρεται η πηγή προέλευσης και να
    διατηρείται το παρόν μήνυμα. Ερωτήματα που αφορούν τη χρήση της εργασίας για
    κερδοσκοπικό σκοπό πρέπει να απευθύνονται προς τον συγγραφέα.\\

    \par\noindent
    Η έγκριση της διδακτορικής διατριβής από την Ανώτατη Σχολή των Ηλεκτρολόγων
    Μηχανικών και Μηχανικών Υπολογιστών του Ε.\ Μ.\ Πολυτεχνείου δεν υποδηλώνει
    αποδοχή των γνωμών του συγγραφέα (Ν.\ 5343/1932, άρθρο 202).
  }
}

% Title pages
\providecommand\titlepage{
  \thispagestyle{empty}
  \begin{adjustwidth*}{}{-\titleadjust}
  \begin{center}
    { \includegraphics[width=5em]{ntua_logo} } \\ 
    { \Large\bfseries\theinstitution } \\
    { \theschool } \\
    { \thedivision } \\
    \vfill
    { \LARGE\bfseries\thetitle } \\
    \vspace{3\baselineskip}
    {\LARGE\documentdescr}
    \vfill
    {\Large \theauthorgen } \\
    \ifthenelse{\equal{\doc@type}{phdthesis}}{
      \vspace{.5\baselineskip}
      \emph{\theauthortitle}
    }{}
    \vfill
    \thedate
  \end{center}
  \end{adjustwidth*}
}

\providecommand\approvalpage{
  \thispagestyle{empty}
  \begin{adjustwidth*}{}{-\titleadjust}
    \begin{minipage}{5em}
      \includegraphics[width=5em]{ntua_logo}
    \end{minipage}
    \begin{tabular}{l}
      \bfseries\large \theinstitution \\
      \large\theschool \\
      \large\thedivision
    \end{tabular}
    \vfill
    \begin{center}
      { \Large\bfseries \thetitle } \\
      \vspace{1.5\baselineskip}
      { \Large \documentdescr } \\
      \vspace{1.5\baselineskip}
      { \large \theauthorgen } \\
      \ifthenelse{\equal{\doc@type}{phdthesis}}{
        \vspace{.5\baselineskip}
        \emph{\theauthortitle}
      }{}
    \end{center}

    \vspace{1.5\baselineskip}
    \par\noindent
    \begin{tabular}{ll}
      {\bfseries\th@advisorytext:} & \committee@a \\
                                   & \committee@b \\
                                   & \committee@c \\
    \end{tabular}

    \vfill
    \par\noindent
    \ifthenelse{\equal{\doc@lang}{gr}}{
      \th@examiningtext την \theexamsday \theexamsmonth \theexamsyear.
    }{
      \th@examiningtext on \theexamsmonth \theexamsday, \theexamsyear.
    }
    \vfill
    \begin{tabular}{lll}
      % New committee row
      \begin{tabular}[c]{ll}
        \th@signatureplaceholder \\
        \committee@a \\
        \committeepos@a
      \end{tabular} &
      \begin{tabular}[c]{ll}
        \th@signatureplaceholder \\
        \committee@b \\
        \committeepos@b
      \end{tabular} &
      \begin{tabular}[c]{ll}
        \th@signatureplaceholder \\
        \committee@c \\
        \committeepos@c
      \end{tabular} \\ [3.5em]
      
      % New committee row
      \begin{tabular}[c]{ll}
        \th@signatureplaceholder \\
        \committee@d \\
        \committeepos@d
      \end{tabular} &
      \begin{tabular}[c]{ll}
        \th@signatureplaceholder \\
        \committee@e \\
        \committeepos@e
      \end{tabular} &
      \begin{tabular}[c]{ll}
        \th@signatureplaceholder \\
        \committee@f \\
        \committeepos@f
      \end{tabular} \\ [3.5em]

      % New committee row
      &
      \begin{tabular}[c]{ll}
        \th@signatureplaceholder \\
        \committee@g \\
        \committeepos@g
      \end{tabular} &
      \\
    \end{tabular}
    \vfill
    \begin{center}
      \thedate
    \end{center}
  \end{adjustwidth*}
  \clearpage
  ~\vfill
  \begin{adjustwidth*}{}{-\titleadjust}
    \begin{tabular}{lll}
      \th@signatureplaceholder \\
      \theauthor \\
      \th@authordrtitle
    \end{tabular}
    \vfill
    \copyrightnotice
  \end{adjustwidth*}
}

% Committee members
\newcounter{nmemb}
\providecommand\committeememb[2]{
  \stepcounter{nmemb}
  \@namedef{committee@\alph{nmemb}}{#1}
  \@namedef{committeepos@\alph{nmemb}}{#2}
}

% Setup the title
% Add a hook for setting up the author and title in pdf properties
\renewcommand\maketitlehookd{
  \hypersetup{
    pdfauthor = \theauthor,
    pdftitle = \thetitle,
  }
}

\renewcommand\maketitle{
  \begin{titlingpage}
    \titlepage
    \maketitlehookd
    \cleardoublepage
    \approvalpage
  \end{titlingpage}
}

% Abstract formatting
\renewcommand\abstractnamefont{\Large\bfseries}
\renewcommand\abstracttextfont{\normalfont}
\renewcommand\abstitleskip{\baselineskip}

% Keyword environment and related stuff
\ifthenelse{\equal{\doc@lang}{gr}}{
  \providecommand\KeywordName{Λέξεις Κλειδιά}
}{
  \providecommand\KeywordName{Keywords}
}
\providecommand\KeywordFont{\bfseries}
\providecommand\KeywordTitleDelim{: }
\providecommand\KeywordTextFont{\normalfont}
\providecommand\KeywordBeforeSkip{\vspace{\baselineskip}}
\providecommand\KeywordAfterSkip{\vspace{\parskip}}

\newenvironment{Keywords}{\KeywordBeforeSkip{\KeywordFont\KeywordName\KeywordTitleDelim}\KeywordTextFont}{\KeywordAfterSkip\normalfont\par}

% Indexing commands and term formatting
\newcommand\term@font{\em}
\providecommand\TermFont[1]{\renewcommand\term@font{#1}}

% Simple term (not included in the index)
\providecommand\Term[1]{{\term@font #1}}

%
% Usage: \IndexedTerm[index text]{term}
%
\providecommand\IndexedTerm[2][]{%
  \ifthenelse{\equal{#1}{}}{%
    #2\index{#2}%
  }{%
    #2\index{#1}%
  }%
}

%
% Usage: \IndexedSubterm{sub}{main}
%        \IndexedSubsubterm{subsub}{sub}{main}
%
\providecommand\IndexedSubterm[2]{\IndexedTerm[#2!#1]{#1}}
\providecommand\IndexedSubsubterm[3]{\IndexedTerm[#3!#2!#1]{#1}}

% Apply visual formatting to the terms
\providecommand\IndexedTermEmph[2][]{{\term@font\IndexedTerm[#1]{#2}}}
\providecommand\IndexedSubtermEmph[2]{{\term@font\IndexedSubterm{#1}{#2}}}
\providecommand\IndexedSubsubtermEmph[3]{{\term@font\IndexedSubsubterm{#1}{#2}{#3}}}

\ifthenelse{\equal{\doc@lang}{gr}}{
  \renewcommand*\seename{βλ.\ }
}{}

% Page layout
\stockaiv
\pageaiv
%% \stockbv
%% \pagebv

\quarkmarks
\settrimmedsize{\paperheight}{\paperwidth}{*}
\setlength\trimtop{.5\stockheight-.5\paperheight}
\setlength\trimedge{.5\stockwidth-.5\paperwidth}
\settrims{\trimtop}{\trimedge}

% Adjust the text width of the title pages
\newlength\titleadjust
\setlength\titleadjust{\paperwidth-\textwidth-2\spinemargin}

%
% The text width depends on the type size. Follow the typographic instructions
% (Table 2.2) in the manual of the memoir class for computing the text block
% width. Please avoid lines larger than 80 characters on average.
%
% The following text width corresponds to 78 characters of Adobe Minion Pro at
% 11pt. Be sure to adjust this, if you change your font or type size. We have
% adjusted experimentally the line width computed in Table 2.2
%
\settypeblocksize{40\baselineskip}{339pt}{*}
\setlrmargins{*}{*}{1.414}
\setulmargins{*}{*}{1}
\setlength\headsep{2\baselineskip}
\setlength\footskip{3.5\baselineskip}
\checkandfixthelayout

% Document styling
\chapterstyle{ell}
\pagestyle{Ruled}
\aliaspagestyle{titlingpage}{empty}
\setsecnumdepth{subsection}
\settocdepth{subsection}
\setlength\parskip{0pt}

% Some fine-tuning of the header styles
\setsecheadstyle{\Large\bfseries\sffamily}
\setsubsecheadstyle{\large\bfseries\sffamily}
\setsubsubsecheadstyle{\large\bfseries\sffamily}
\setparaheadstyle{\bfseries\sffamily}
\setbeforeparaskip{\baselineskip}

% Setup some float parameters
\setlength\floatsep{1em}
\setlength\textfloatsep{\baselineskip}

% Caption support for continued floats
\ifthenelse{\equal{\doc@lang}{gr}}{
  \DeclareCaptionLabelFormat{continued}{#1~#2 (συνέχεια)}
}{
  \DeclareCaptionLabelFormat{continued}{#1~#2 (Cont.)}
}

\captionsetup[ContinuedFloat]{labelformat=continued}

% Special setup for subfigure captions in greek
\ifthenelse{\equal{\doc@lang}{gr}}{
  \renewcommand\thesubfigure{\roman{subfigure}}
}{}

% Footnote setup
\setlength\footmarkwidth{-1ex}
\setlength\footmarksep{1ex}

%
% Extra space for large floats. Use with the adjustwidth environment.
%
\providecommand\FloatExtraWidth{.1\textwidth}

% Lists and enumerations
\firmlists
\setlength\leftmargin{\parindent}

% Other style commands
\urlstyle{sf}

% Bibliography style
\ifthenelse{\equal{\doc@lang}{gr}}{
  \bibliographystyle{plainnat_gr}
}{
  \bibliographystyle{plainnat}
}

\ifthenelse{\equal{\doc@lang}{gr}}{
  \renewcommand{\cite}[2][]{\textenglish{\citep[#1]{#2}}}
}{
  \renewcommand{\cite}[2][]{\citep[#1]{#2}}
}

% Setup hyperref
\hypersetup{
  pdfsubject = {\documentdescr},
  pdfdisplaydoctitle,
  pdfborder = false,
}

\makeatother
