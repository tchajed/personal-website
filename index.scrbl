#lang scribble/html

@(define (email) "tchajed@mit.edu")

@(define (named-meta name content)
   (element 'meta name: name content: content))

@(require "pubs.rkt")

@doctype['html]

@html{
 @head{
  @title{Tej Chajed}
  @meta[charset: "UTF-8"]
  @named-meta["keywords"]{Tej,Chajed,MIT,computer science}
  @named-meta["description"]{@"I'm Tej Chajed, a fifth-year PhD student in PDOS
   at MIT CSAIL working with Frans Kaashoek and Nickolai Zeldovich."}
  @named-meta["author"]{@"Tej Chajed <tchajed@mit.edu>"}
  @named-meta["viewport"]{width=device-width, initial-scale=1.0}
  @link[rel: "canonical" href: "https://www.chajed.io"]
  @link[rel: "stylesheet" href: "assets/main.css"]
  @link[rel: "stylesheet" type: "text/css" href: "https://fonts.googleapis.com/css?family=Open+Sans"]
  @literal{
   <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130703705-1"></script>
   <script>
   window.dataLayer = window.dataLayer || [];
   function gtag(){dataLayer.push(arguments);}
   gtag('js', new Date());

   gtag('config', 'UA-130703705-1');
   </script>
  }
 }
 @body{
  @h1{Tej Chajed}
  @div[class: "intro container"]{
   @div[class: "bio"]{
    @span[class: "email"]{@email}
    @p{Hello! I'm Tej Chajed, a fifth-year PhD student in
     @a[href: "https://pdos.csail.mit.edu/"]{PDOS} at MIT CSAIL, advised by Frans
     Kaashoek and Nickolai Zeldovich. I work on formal verification of
     systems @entity['mdash] I implement systems and prove that they're correct.}
    @p{Before coming to MIT I was at UIUC, where I got undergraduate degrees
     in Electrical Engineering and Computer Science.}
   }
   @img[class: "portrait"
        alt: "Tej Chajed picture"
        src: "assets/portrait.jpg"
        width: 250
        height: 250]
  }

  @h2{Research}
  @p{In my research I develop new techniques for writing verified systems
   software. For each system, we use the Coq proof assistant to write a
   specification, implement the system, and write a machine-checked proof that
   the implementation meets the specification. Every system is also an
   exploration in new techniques for systems verification. My work so far has
   centered around a theme of storage systems, especially work on the FSCQ
   verified file system, and on concurrency.}

  @p{I do a lot of work on Coq-related things, including maintaining a
   @a[href: "https://github.com/tchajed/coq-tricks"]{list of Coq tricks} for
   the advanced user.}

  @h2{Publications}
  @pubs
 }
}