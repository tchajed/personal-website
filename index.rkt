#lang at-exp racket

(require scribble/html)

(require "pubs.rkt")
(require "lib.rkt")

(define email "tchajed@mit.edu")

(define (named-meta name . content)
  (apply element 'meta name: name content: content))

(define page-head
  @head{
 @title{Tej Chajed}
 @meta[charset: "UTF-8"]
 @named-meta["keywords"]{Tej,Chajed,MIT,computer science}
 @named-meta["description"]{@"I'm Tej Chajed, a final-year PhD student in PDOS
  at MIT CSAIL working with Frans Kaashoek and Nickolai Zeldovich."}
 @named-meta["author"]{@"Tej Chajed <tchajed@mit.edu>"}
 @named-meta["viewport"]{width=device-width, initial-scale=1.0}
 @link[rel: "canonical" href: "https://www.chajed.io"]
 @link[rel: "stylesheet" href: "assets/main.css"]
 @link[rel: "stylesheet" href: "https://fonts.googleapis.com/css?family=Open+Sans:400,600"]
 @literal{
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130703705-1"></script>
  <script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-130703705-1');
  </script>
 }
 })

(define research-statement
  @file-link["files/research-statement.pdf"]{research statement})
(define teaching-statement
  @file-link["files/teaching-statement.pdf"]{teaching statement})
(define cv-link @file-link["files/cv.pdf"]{CV})
(define daisy-nfsd-link @a[href: "https://github.com/mit-pdos/daisy-nfsd"]{DaisyNFS})
(define perennial-link @a[href: "https://github.com/mit-pdos/perennial"]{Perennial})
(define goose-link @a[href: "https://github.com/tchajed/goose"]{Goose})

(define (service-link url . content)
  @a[href: url]{@span[class: "pub-title"]{@content}})

(define page-body
  @body{
 @h1{Tej Chajed}
 @div[class: "intro container"]{
  @div[class: "bio"]{
   @span[class: "email"]{@|email|}
   @p{I'm Tej Chajed, a final-year PhD student in
    @a[href: "https://pdos.csail.mit.edu/"]{PDOS} at MIT CSAIL, advised by Frans
    Kaashoek and Nickolai Zeldovich. I work on formal verification of systems
    software @entity['mdash] I implement systems and prove they do what they're
    supposed to.}
   @p{Before coming to MIT I was at UIUC, where I got undergraduate degrees
    in Electrical Engineering and Computer Science.}
   @p{@span[class: "bold"]{I am on the faculty job market this year.}
           You can find my @|research-statement|, @|teaching-statement|, and @|cv-link| here.}
  }
  @img[class: "portrait"
       alt: "Tej Chajed picture"
       src: "assets/portrait.jpg"
       width: "200em"
       height: "200em"]
 }

 @h2{Research} @p{Even critical systems software has bugs @entity['mdash] for
example, file systems have bugs that occasionally lead to users losing data. My
research aims to write systems software that always does what it's supposed to.
We do this with formal verification: we write a precise specification of what
the system is supposed to do and prove that the implementation meets the
specification. My research has culminated in @|daisy-nfsd-link|, a verified,
concurrent file system that gets good performance.  The path to verifying
DaisyNFS involved developing new frameworks and tools, including
@|perennial-link|, a framework for reasoning about crash safety and concurrency,
and @|goose-link|, a system for connecting the proofs to Go code.}

 @p{I do a lot of work on Coq-related things, including maintaining a
  @a[href: "https://github.com/tchajed/coq-tricks"]{list of Coq tricks} for the
  advanced user and contributing to @a[href: "https://iris-project.org/"]{Iris}.}

 @p{I'm a communication Fellow in the @a[href: "https://mitcommlab.mit.edu/eecs/"]{EECS
Communication Lab}, where I help students with technical communication. If
you're working on something where you think I could help, please reach out! I'm
particularly excited about working on research papers and conference
presentations.}

 @h2{Publications}
 @pubs

 @h2{Teaching}
 I helped create 6.826 (Principles of Computer Systems), a class on systems
verification, and in particular I created the lab assignments. I was a TA for
the class in @a[href: "https://6826.csail.mit.edu/2020/"]{Fall 2020}, @a[href:
"https://6826.csail.mit.edu/2019/"]{Fall 2019}, and @a[href:
"https://6826.csail.mit.edu/2017/"]{Fall 2017}.

 @h2{Service}
During my PhD I served on a conference program committee for PLDI 2022 and
several artifact evaluation committees (AECs).
 @ul{
     @li{@service-link["https://conf.researchr.org/committee/POPL-2023/POPL-2023-popl-research-papers-program-committee"]{POPL 2023 PC}}
     @li{@service-link["https://pldi22.sigplan.org/committee/pldi-2022-pldi-program-committee"]{PLDI 2022 PC}}
     @li{@service-link["https://popl22.sigplan.org/committee/POPL-2022-artifact-evaluation-artifact-evaluation-comittee"]{POPL 2022 AEC}}
     @li{@service-link["https://eurodw21.github.io/"]{EuroDW 2021 PC}}
     @li{@service-link["https://popl21.sigplan.org/track/POPL-2021-Artifact-Evaluation"]{POPL 2021 AEC}}
     @li{@service-link["https://pldi20.sigplan.org/track/pldi-2020-PLDI-Research-Artifacts"]{PLDI 2020 AEC}}
     @li{@service-link["https://popl20.sigplan.org/track/POPL-2020-Artifact-Evaluation"]{POPL 2020 AEC}}
     @li{@service-link["https://sysartifacts.github.io/"]{SOSP 2019 AEC}}
     @;@li{@a[href: "https://eurosys2019.org/call-for-shadow-pc-participation/"]{@span[class: "pub-title"]{EuroSys 2019 Shadow PC}}}
     }

@h2{How to pronounce my name}
 "Tej" rhymes with "page", and Chajed is pronounced as written (CHA-jed).
 @;{
 @; if you can read this, you probably already pronounce Tej correctly
 In Hindi it's तेज छाजेड़.
 @; this is utterly unhelpful
 In @a[href: "https://en.wikipedia.org/wiki/Help:IPA/English"]{IPA} the Americanized pronunciation of my name is teɪdʒ tʃɑːdʒɛd.
 }
  })

(define doc
  (list @doctype['html]
        @html{
 @|page-head|
 @|page-body|
 }))

(output-xml doc)
