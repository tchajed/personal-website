#lang at-exp racket

(require scribble/html/html)
(require racket/format)

(define (osdi year)
  (let* ([short @~a{OSDI @year}]
         [fullname @~a{USENIX Symposium on Operating System
           Design and Implementation (@|short|)}])
    (make-immutable-hash `((fullname . ,fullname)
                           (short . ,short)))))
                         

(define cspec
  (make-immutable-hash
   `((key . "cspec:osdi2018")
     (title . "Verifying concurrent software using movers in CSPEC")
     (conference . ,(osdi 2018))
     (slides . #t))
   ))

(define (pub-title pub)
  (define key (hash-ref pub 'key))
  (define title (hash-ref pub 'title))
  (define conference (hash-ref pub 'conference))
  @div{
 @span['class: "pub-title"]{
  @a['href: @~a{papers/@|key|.pdf}]{@title}
 }
 @nbsp
 @span['class: "pub-conference"]{
  @abbr['title: (hash-ref conference 'fullname)]{@(hash-ref conference 'short)}
 }
 })

(provide pubs)
(define (pubs)
  @div['class: "pub"]{
 @div['class: "pub-header container"]{
  @(pub-title cspec)
  @div['class: "pub-links"]{
   @a['href: "papers/cspec:osdi18.pdf"]{
    @img['title: "Paper PDF" 'alt: "paper icon"
         'src: "assets/file.svg" 'height: 16 'width: 16]
   }
   @a['href: "papers/cspec:osdi18-slides.pdf"]{
    @img['title: "Slides" 'alt: "slides icon"
         'src: "assets/slides.svg" 'height: 16 'width: 16]
   }
  }
 }
 @span['class: "self-author"]{Tej Chajed},
 M. Frans Kaashoek,
 Butler Lampson,
 and Nickolai Zeldovich
 })
