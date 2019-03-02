#lang at-exp racket

(require scribble/html/html)
(require racket/format)

;; Publication data representations

(define (mk-conference fullname short)
  (make-immutable-hash `((fullname . ,(format "~a (~a)" fullname short))
                         (short . ,short))))

(define (mk-pub
         key
         #:title title
         #:conference conference
         #:slides? [slides? #f]
         #:authors authors)
  (make-immutable-hash
   `((key . ,key)
     (title . ,title)
     (conference . ,conference)
     (slides? . ,slides?)
     (authors . ,authors))))

;; HTML formatting for publications

(define (pub-conference conference)
  (let* ([fullname (hash-ref conference 'fullname)]
         [short (hash-ref conference 'short)]
         [abbrv-conf (@abbr['title: fullname]{@short})])
    @span['class: "pub-conference"]{@abbrv-conf}))

(define (pub-title pub)
  (define key (hash-ref pub 'key))
  (define title (hash-ref pub 'title))
  (define conference (hash-ref pub 'conference))
  @div{
 @span['class: "pub-title"]{
  @a['href: @~a{papers/@|key|.pdf}]{@title}
 }
 @nbsp
 @pub-conference[(hash-ref pub 'conference)]
 })

(define (ifdef cond . body)
  (if cond body ""))

(define (pub-links pub)
  (define key (hash-ref pub 'key))
  @div['class: "pub-links"]{
 @a['href: @~a{papers/@|key|.pdf}]{
  @img['title: "Paper PDF" 'alt: "paper icon"
       'src: "assets/file.svg" 'height: 16 'width: 16]
 }
 @ifdef[(hash-ref pub 'slides?)]{
  @a['href: @~a{papers/@|key|-slides.pdf}]{
   @img['title: "Slides" 'alt: "slides icon"
        'src: "assets/slides.svg" 'height: 16 'width: 16]
 }}
 })

(define (pub-authors pub)
  (add-between (hash-ref pub 'authors) ", " #:before-last ", and "))

(define (publication pub)
  @div['class: "pub"]{
 @div['class: "pub-header container"]{
  @pub-title[pub]
  @pub-links[pub]
 }
 @(pub-authors pub)
 })

;; The data for the publication list

(define (osdi year)
  (let ([short @~a{OSDI @year}]
        [fullname @~a{USENIX Symposium on Operating System @;
          Design and Implementation}])
    (mk-conference fullname short)))

(define (sosp year)
  (let ([short @~a{SOSP @year}]
        [fullname @~a{ACM Symposium on Operating System @;
          Principles}])
    (mk-conference fullname short)))

(define (pldi year)
  (let ([short @~a{PLDI @year}]
        [fullname @{SIGPLAN Conference on Programming Language @;
          Design and Implementation}])
    (mk-conference fullname short)))

(define tej @span['class: "self-author"]{Tej Chajed})
(define atalay "Atalay İleri")
(define joe "Joseph Tassarotti")
(define adam "Adam Chlipala")
(define haogang "Haogang Chen")
(define frans "M. Frans Kaashoek")
(define nickolai "Nickolai Zeldovich")

(provide pubs)
(define (pubs)
  (let ([pub-list
         (list
          (mk-pub "cspec:osdi2018"
                  #:title "Verifying concurrent software using movers in CSPEC"
                  #:conference (osdi 2018)
                  #:slides? #t
                  #:authors (list tej frans "Butler Lampson" nickolai))
          (mk-pub "disksec:osdi2018"
                  #:title "Proving confidentiality in a file system using DiskSec"
                  #:conference (osdi 2018)
                  #:authors (list atalay tej adam frans nickolai))
          (mk-pub "dfscq:sosp2017"
                  #:title @list{Verifying a high-performance crash-safe file system@br @;
          using a tree specification}
                  #:slides? #t
                  #:conference (sosp 2017)
                  #:authors (list "Haogang Chen" tej "Alex Konradi" "Stephanie Wang" atalay
                                  adam frans nickolai))
          (mk-pub "cfscq:sosp2017-src"
                  #:title "Extending a verified file system with concurrency"
                  #:conference (mk-conference
                                "Student Research Competition at ACM Symposium on Operating System Principles"
                                "SOSP 2017 SRC")
                  #:authors (list tej adam frans nickolai))
          (mk-pub "fscq:cacm2017"
                  #:title @list{Certifying a file system using Crash Hoare Logic:@br Correctness in the presence of crashes}
                  #:conference (mk-conference
                                "Communications of the ACM"
                                "CACM 2017")
                  #:authors (list tej haogang adam frans nickolai "Daniel Ziegler"))
          (mk-pub "fscq:sosp2015"
                  #:title "Using Crash Hoare Logic for certifying the FSCQ file system"
                  #:conference (sosp 2015)
                  #:authors (list haogang "Daniel Ziegler" tej adam frans nickolai))
          )])
    (map publication pub-list)))
