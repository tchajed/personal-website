#lang at-exp racket

(require scribble/html)

(require "pubs.rkt")

(define email "tchajed@mit.edu")

(define (named-meta name . content)
  (apply element 'meta name: name content: content))

(define page-head
  @head{
 @title{Tej Chajed}
 @meta[charset: "UTF-8"]
 @named-meta["keywords"]{Tej,Chajed,MIT,computer science}
 @named-meta["description"]{@"I'm Tej Chajed, a sixth-year PhD student in PDOS
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

(define page-body
  @body{
 @h1{Tej Chajed}
 @div[class: "intro container"]{
  @div[class: "bio"]{
   @span[class: "email"]{@|email|}
   @p{I'm Tej Chajed, a sixth-year PhD student in
    @a[href: "https://pdos.csail.mit.edu/"]{PDOS} at MIT CSAIL, advised by Frans
    Kaashoek and Nickolai Zeldovich. I work on formal verification of systems
    software @entity['mdash] I implement systems and prove they do what they're
    supposed to.}
   @p{Before coming to MIT I was at UIUC, where I got undergraduate degrees
    in Electrical Engineering and Computer Science.}
  }
  @img[class: "portrait"
       alt: "Tej Chajed picture"
       src: "assets/portrait.jpg"
       width: 250
       height: 250]
 }

 @h2{Research} @p{Even critical systems software has bugs @entity['mdash] for
example, file systems have bugs that occasionally lead to users losing data. My
research aims to write systems software that always does what it's supposed to.
We do this with formal verification: we write a precise specification of what
the system is supposed to do and prove that the implementation meets the
specification. These proofs are implemented and checked using a computer with
the Coq proof assistant, giving us high assurance that the proofs are correct.
So far my work has centered around a theme of storage systems and concurrency,
including a verified file system (FSCQ) and a framework that combines
concurrency and crash-safety reasoning.}

 @p{I do a lot of work on Coq-related things, including maintaining a
  @a[href: "https://github.com/tchajed/coq-tricks"]{list of Coq tricks} for
  the advanced user.}

 @h2{Publications}
 @pubs

 @h2{Service}
 @ul{
     @li{@a[href: "https://pldi20.sigplan.org/track/pldi-2020-PLDI-Research-Artifacts"]{@span[class: "pub-title"]{PLDI 2020 AEC}}}
     @li{@a[href: "https://popl20.sigplan.org/track/POPL-2020-Artifact-Evaluation"]{@span[class: "pub-title"]{POPL 2020 AEC}}}
     @li{@a[href: "https://sysartifacts.github.io/"]{@span[class: "pub-title"]{SOSP 2019 AEC}}}
     }

 @h3{How to pronounce my name}
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
