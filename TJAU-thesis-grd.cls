%==================================================
%% TJAU-thesis-grd.cls for TJAU Thesis
%% modified by wang yuan
%% version: 0.1
%% last update: Dec 13th, 2019
%%==================================================

%% math packages -- conflict with xunicode
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
% 直立希腊字母字体
\RequirePackage{upgreek}
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{TJAU-thesis-grd}
  [2019/12/12 v0.1 TJAU-thesis-grd document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifTJAU@master\TJAU@masterfalse
\newif\ifTJAU@doctor\TJAU@doctorfalse
\newif\ifTJAU@istwoside\TJAU@istwosidefalse
\DeclareOption{twoside}{\TJAU@istwosidetrue}
\DeclareOption{master}{\TJAU@mastertrue}
\DeclareOption{doctor}{\TJAU@doctortrue}

\ProcessOptions\relax
\ifTJAU@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi
%%
%% the setup of ctex package
%%
\def\CTEX@contentsname{目录}
\def\CTEX@listfigurename{插图索引}
\def\CTEX@listtablename{表格索引}

%% 设置圆圈的格式 或使用\textcircled
\usepackage{tikz}
\usepackage{etoolbox}
\usepackage{ctex}
\usepackage{float}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}

\def\TJAU@label@abstract{\heiti\zihao{3}\text{摘}\quad\text{要}}
\def\TJAU@label@englishabstract{ABSTRACT}
\def\TJAU@label@keywords{关键词：}
\def\TJAU@label@englishkeywords{Key Words:~}
\def\TJAU@label@conclusion{结论}
\def\TJAU@label@appendix{\heiti\zihao{4}附录}
%\def\TJAU@label@publications{攻读学位期间发表论文与研究成果清单}
%\def\TJAU@label@projects{攻读学位期间参与的项目}
%\def\TJAU@label@resume{作者简介}
\def\TJAU@label@reference{参\hspace{\ccwd}考文献}
\def\TJAU@label@thanks{致~~谢}
\def\TJAU@value@templateversion{v0.1}
%%
%% label in the head 页眉页脚
%%
\def\TJAU@label@headschoolname{天津农学院本科毕业论文}

%% 当前模板的版本
\newcommand{\version}{\TJAU@value@templateversion}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  {\if@openright\cleardoublepage\else\clearpage\fi}{\par\relax}
%  {}{}
%%==============引用geometry 宏包设置纸张和页面========================
%天津农学院
%设置版面:上3cm，下2.5cm，左3.5cm，右2cm，页眉1.2cm，页脚1.2cm，装订线0cm
\usepackage[
paper=a4paper,%
top=3cm,% 上 3cm %
bottom=2.5cm,% 下 2.5cm %
left=3.5cm,% 左 3.5cm %
right=2cm,% 右 2cm %
headheight=1.2cm,% 页眉 1.2cm %
footskip=1.2cm% 页脚 1.8cm %
]{geometry} % 页面设置 %
%% =========================================================

\parskip 0.5ex plus 0.25ex minus 0.25ex
%% Command -- Clear Double Page
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%设置行距，大概为22榜
\RequirePackage{setspace}
\setstretch{1.523}

%% 设置章节格式, 
\ctexset{chapter={
	  name={},
      number = {\arabic{chapter}},
      format = {\centering\heiti\zihao{-4}},
	  aftername={\hspace{\ccwd}},
      pagestyle = plain,
      beforeskip = 11bp,
      afterskip = 11bp,
      fixskip = true,}
}

%% 设置一级章节格式
% 黑体小四号加粗顶左
\ctexset{section={
  format={\raggedright \heiti \zihao{-4}},
  aftername={\hspace{0.5\ccwd}},
  beforeskip =11bp,
  afterskip = 11bp,
  fixskip = true,
  }
}
% 设置二级标题格式
% 黑体小四加粗顶左
\ctexset{subsection={
   format = {\heiti \raggedright \zihao{-4}},
   aftername={\hspace{0.5\ccwd}},
   beforeskip =11bp,
   afterskip = 11bp,
   fixskip = true,
   }
}
% 设置三节标题格式
\ctexset{subsubsection={
      format={ \raggedright\heiti \zihao{-4}},
      aftername={\hspace{0.5\ccwd}},
      beforeskip=11bp,
      afterskip=11bp,
      fixskip=true,
  }
}
\ctexset{%
  punct=quanjiao,
  space=auto,
  autoindent=true}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ctexset{
bibname=参~考~文~献}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 设定目录格式。目录颜色更改黑色
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\fangsong \zihao{-4}}
    {\thecontentslabel\hspace{\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[0pt]{\fangsong \zihao{-4}}
    {\thecontentslabel\hspace{0.5\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[0pt]{\fangsong \zihao{-4}}
    {\thecontentslabel\hspace{0.5\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{figure}[0pt]{\fangsong\zihao{-4}}
    {\figurename~\thecontentslabel\quad}{\hspace*{0cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{table}[0pt]{\fangsong\zihao{-4}}
    {\tablename~\thecontentslabel\quad}{\hspace*{0cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}

%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
\RequirePackage{ifpdf}

%% fancyhdr 页眉页脚控制
\RequirePackage{fancyhdr}

% 空 页眉页脚
\fancypagestyle{TJAU@empty}{%
  \fancyhf{}}

%======正文页眉页脚=================
\fancypagestyle{TJAU@headings}{%
  \fancyhf{}
  \fancyfoot[C]{\songti\zihao{5} \thepage}
  \fancyhead[C]{\ifTJAU@master\zihao{5}{\songti 天津农学院硕士学位论文}
                \else\zihao{5}{\songti 天津农学院博士学位论文}\fi}
  }

%==================================对于openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。===================
\let\TJAU@cleardoublepage\cleardoublepage
\newcommand{\TJAU@clearemptydoublepage}{%
	\clearpage{\pagestyle{TJAU@empty}\TJAU@cleardoublepage}}
\let\cleardoublepage\TJAU@clearemptydoublepage

 %================修该frontmatter 的页码为大写罗马格式，并调整页面风格===============
\renewcommand{\frontmatter}{
 \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{TJAU@headings}
}
%=======================修改mainmatter 的页码为阿拉伯格式，并调整页面风格========================
\renewcommand{\mainmatter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{empty}
}


%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}


%% 定义几个常用的数学常量符号
\newcommand{\me}{\mathrm{e}} %定义 对数常数e，虚数符号i,j以及微分算子d为直立体。
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}} 

\theoremstyle{plain}
  \newtheorem{algo}{算法~}[chapter]
  \newtheorem{thm}{定理~}[chapter]
  \newtheorem{lem}[thm]{引理~}
  \newtheorem{prop}[thm]{命题~}
  \newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
  \newtheorem{defn}{定义~}[chapter]
  \newtheorem{conj}{猜想~}[chapter]
  \newtheorem{exmp}{例~}[chapter]
  \newtheorem{rem}{注~}
  \newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

%% 英文字体使用 Times New Roman
\RequirePackage{xltxtra} % \XeTeX Logo
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
%\RequirePackage{mathspec}
%\setmainfont{Times New Roman}
%\setmathsfont{Times New Roman}

%% graphics packages
\RequirePackage{graphicx}
%% 并列子图
\RequirePackage{subfigure}

\RequirePackage{wrapfig}
%%===========================设置图表标题选项==========================
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{0.5\ccwd}}
\DeclareCaptionFont{fontsize}{\sf\heiti\zihao{5}}

\captionsetup{
  font = {fontsize},
  labelsep = zhspace,
}
\captionsetup[table]{
  position = top,
  aboveskip = 1bp,
  belowskip = 0.25bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
  position = bottom,
  aboveskip = 11bp,
  belowskip = 6bp,
}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
% ccaption -- bicaption
%\RequirePackage{ccaption}
%\captiondelim{\ }
%\captionnamefont{\songti\zihao{5}}
%\captiontitlefont{\songti\zihao{5}}


%% sort and compress citations
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}


% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% 定公式、图、表编号
\renewcommand\theequation{\arabic{equation}}
\renewcommand\thefigure{\arabic{figure}}
\renewcommand\thetable{\arabic{table}}

% 颜色宏包
\RequirePackage{xcolor}


% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头


%% hyperref package

\RequirePackage{hyperref}
%\definecolor{navyblue}{RGB}{0,0,128}   %增加海军蓝颜色
\hypersetup{
  bookmarksnumbered,%
  linktoc=all,
  colorlinks=true,
  citecolor=blue,
  filecolor=cyan,
  linkcolor=blue,
  linkbordercolor=blue,
  urlcolor=blue,
  plainpages=false,%
  pdfstartview=FitH
}

%% enumerate 列表环境间距调节
%\usepackage{enumitem}
% \setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
% \setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
% \setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%_  参考文献风格 added by wei.jianwen@gmail.com
\bibliographystyle{GBT7714-2005NLang}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%封面相关命令
\def\TJAU@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\TJAUunderline{\@ifnextchar[\TJAU@underline\underline}


\RequirePackage{xeCJK}
\newcommand{\thechengji}{}
\newcommand{\thetitle}{}
\newcommand{\englishtitle}{}
\newcommand{\theauthor}{}
\newcommand{\thedate}{}
\newcommand{\theschool}{}
\newcommand{\themajor}{}
\newcommand{\theadvisor}{}
\newcommand{\thexibie}{}
\newcommand{\chinesespace}{\char"3000}

\renewcommand{\title}[1]{
  \renewcommand{\thetitle}{#1}
}
\newcommand{\etitle}[1]{
  \renewcommand{\englishtitle}{#1}
}

\renewcommand{\author}[1]{
  \renewcommand{\theauthor}{#1}
}

\renewcommand{\date}[1]{
  \renewcommand{\thedate}{#1}
}

\newcommand{\major}[1]{
  \renewcommand{\themajor}{#1}
}

\newcommand{\school}[1]{
  \renewcommand{\theschool}{#1}
}

\newcommand{\chengji}[1]{
  \renewcommand{\thechengji}{#1}
}

\newcommand{\advisor}[1]{
  \renewcommand{\theadvisor}{#1}
}

\newcommand{\xibie}[1]{
  \renewcommand{\thexibie}{#1}
}


\newcommand{\makecover}{
\thispagestyle{empty}
\vspace*{60bp}
\begin{center}
  \fontsize{36pt}{36pt}\selectfont \setCJKfamilyfont{hwxw}{STXinwei}                            %华文行楷  hwxk
  \newcommand{\hw}{\CJKfamily{hwxw}} {\hw 天津农学院}\\
  \fontsize{42pt}{42pt}\selectfont \setCJKfamilyfont{hwxw}{STXinwei} 
  \newcommand{\hwxw}{\CJKfamily{hwxw}} {\hw 毕~~~~业~~~~论~~~~文} \\[30bp]
  \begin{tabular}{ll}
    \fontsize{15pt}{15pt}\selectfont {\heiti 论文题目:} &{
          \fontsize{12pt}{12pt}\selectfont
          \songti\thetitle
    } \\
    \fontsize{15pt}{15pt}\selectfont {\heiti 英文题目:} &{
          \fontsize{12pt}{12pt}\selectfont
          \songti\englishtitle
    } \\
  \end{tabular} 
\vskip 60pt
  \begin{tabular}{lll}
    \fontsize{14pt}{14pt}\selectfont{\heiti 学生姓名} & \fontsize{14pt}{14pt}\selectfont\TJAUunderline[215pt]{\songti\leftline{\theauthor}}\\[-0.8em]
    \fontsize{14pt}{14pt}\selectfont{\heiti 二级学院} & \fontsize{14pt}{14pt}\selectfont\TJAUunderline[215pt]{\songti\leftline{\theschool}}\\[-0.8em]
    \fontsize{14pt}{14pt}\selectfont{\heiti 专业班级} & \fontsize{14pt}{14pt}\selectfont\TJAUunderline[215pt]{\songti\leftline{\themajor}}\\[-0.8em]
    \fontsize{14pt}{14pt}\selectfont{\heiti 系~~~~~~~~别} & \fontsize{14pt}{14pt}\selectfont\TJAUunderline[215pt]{\songti\leftline{\thexibie}}\\[-0.8em]
    \fontsize{14pt}{14pt}\selectfont{\heiti 指导教师} & \fontsize{14pt}{14pt}\selectfont\TJAUunderline[215pt]{\songti\leftline{\theadvisor}}\\[-0.8em]
    \fontsize{14pt}{14pt}\selectfont{\heiti 成绩评定} & \fontsize{14pt}{14pt}\selectfont\TJAUunderline[215pt]{\songti\leftline{\thechengji}}
  \end{tabular}
\end{center}
\centerline{\zihao{4}2020年6月}
}
% 页眉页脚
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\songti \zihao{5} \TJAU@label@headschoolname}  % 奇数页左页眉
\fancyfoot[C]{\songti \zihao{5} {\thepage}}      % 页脚


\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
  \fancyhf{}%
  \fancyfoot[C]{\songti \zihao{5} \TJAU@label@headschoolname}
  \fancyfoot[C]{\songti \zihao{5}{\thepage}} %%首页页脚格式
}


 % 中文摘要

\newenvironment{abstract}
 {
  \cleardoublepage
  \chapter*{\TJAU@label@abstract}
\vskip 16.5pt
 }
 {}
%下一页从偶数页开始
 \newcommand\beginatevenpage{
 \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
 }
 % 中文关键词
 \newcommand\keywords[1]{%
   \vspace{2ex}\noindent{\bf \TJAU@label@keywords} #1}

 % 英文摘要
 \newenvironment{englishabstract}
 {
  \clearpage
  \vskip 16pt
  \chapter*{\zihao{3}\TJAU@label@englishabstract}
  \vskip 12pt
  
 }
 {}

 % 英文摘要
 \newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \TJAU@label@englishkeywords} #1}


%_ 目录

\renewcommand\contentsname{\heiti\zihao{3}\text{目}\quad\text{录}}
\renewcommand\tableofcontents{%
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \pdfbookmark[0]{目录}{TJAUtoc}
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}



%_ 参考文献环境
\renewenvironment{thebibliography}[1]
     {\zihao{5}
      \chapter*{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \addcontentsline{toc}{chapter}{参~考~文~献}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


\newenvironment{publications}[1]
     {\chapter{\TJAU@label@publications}%
      \@mkboth{\MakeUppercase\TJAU@label@publications}
              {\MakeUppercase\TJAU@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}


\newenvironment{projects}[1]
     {\chapter{\TJAU@label@projects}%
      \@mkboth{\MakeUppercase\TJAU@label@projects}
              {\MakeUppercase\TJAU@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

    \newenvironment{resume}
  {\chapter{\TJAU@label@resume}}
  {}

\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}

\newenvironment{resumeli}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}

%\newenvironment{conclusion}
%  {\chapter*{结论}
%    \@mkboth{结论}{结论}%
%    \addcontentsline{toc}{chapter}{结论}}
%  {}

\renewenvironment{thanks}
  {
   \vskip 26bp
   \chapter{\TJAU@label@thanks}
   \vskip 22bp

  }
{}


\newenvironment{symbolnote}
  {\chapter{\TJAU@label@symbolnote}
  \fangsong}
  {}

  %%%============================术语=====================
  \newcommand{\TJAU@denotation@name}{主要符号对照表}
  \newenvironment{denotation}[1][2.5cm]{
      \chapter{\TJAU@denotation@name} % no tocline
      \noindent\begin{list}{}%
      {\vskip-30bp\zihao{-4}
       \renewcommand\makelabel[1]{##1\hfil}
       \setlength{\labelwidth}{#1} % 标签盒子宽度
       \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
       \setlength{\itemindent}{0cm} % 标签缩进量
       \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
       \setlength{\rightmargin}{0cm}
       \setlength{\parsep}{0cm} % 段落间距
       \setlength{\itemsep}{0cm} % 标签间距
      \setlength{\listparindent}{0cm} % 段落缩进量
      \setlength{\topsep}{0pt} % 标签与上文的间距
     }}{\end{list}}
%====增加化学、国际单位宏包
     \RequirePackage[version=4]{mhchem}
     \RequirePackage{siunitx}
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)


\endinput
%%
%% End of file `TJAUmaster-xetex.cls'.
