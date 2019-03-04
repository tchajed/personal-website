#lang at-exp racket

(require scribble/html)
(require racket/format)

;; Publication data representations

(struct conf (fullname short to-appear?))
(define (mk-conference name short #:to-appear? [to-appear? #f])
  (conf (format "~a (~a)" name short) short to-appear?))

(struct pub (key title conference slides? authors)
  #:constructor-name mk-publication)
(define (mk-pub
         key
         #:title title
         #:conference conference
         #:slides? [slides? #f]
         #:authors authors)
  (mk-publication key title conference slides? authors))
(define (pub-published? pub)
  (not (conf-to-appear? (pub-conference pub))))

;; HTML formatting for publications

(define (html/conf conference)
  (let* ([short (conf-short conference)]
         [abbrv-conf (@abbr[title: (conf-fullname conference)]{@short})])
    @span[class: "pub-conference"]{
 (@(if (conf-to-appear? conference)
       @list{conditionally accepted to @abbrv-conf}
       abbrv-conf))
 }))

(define (html/pub-title pub)
  (let ([key (pub-key pub)]
        [title (pub-title pub)])
    @div{
 @span[class: "pub-title"]{
  @(if (pub-published? pub)
       @a[href: @~a{papers/@|key|.pdf}]{@title}
       title)
 }
 @nbsp
 @html/conf[(pub-conference pub)]
 }))

(define (ifdef cond . body)
  (if cond body ""))

(define (html/pub-links pub)
  (let ([key (pub-key pub)])
    @ifdef[(pub-published? pub)]{
 @div[class: "pub-links"]{
  @a[href: @~a{papers/@|key|.pdf}]{
   @img[title: "Paper PDF" 'alt: "paper icon"
        src: "assets/file.svg" 'height: 16 'width: 16]
  }
  @ifdef[(pub-slides? pub)]{
   @a[href: @~a{papers/@|key|-slides.pdf}]{
    @img[title: "Slides" 'alt: "slides icon"
         src: "assets/slides.svg" 'height: 16 'width: 16]
  }}
  }}))

(define (html/authors pub)
  (add-between (pub-authors pub) ", " #:before-last ", and "))

(define (html/pub pub)
  @div[class: "pub"]{
 @div[class: "pub-header container"]{
  @html/pub-title[pub]
  @html/pub-links[pub]
 }
 @html/authors[pub]
 })

;; The publication list

(provide pubs)
(define (pubs)
  ;; local data to define publication list
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

  (define (pldi year #:to-appear? [to-appear? #f])
    (let ([short @~a{PLDI @year}]
          [fullname @~a{SIGPLAN Conference on Programming Language @;
            Design and Implementation}])
      (mk-conference fullname short #:to-appear? to-appear?)))

  (let* ([tej @span[class: "self-author"]{Tej Chajed}]
         [atalay "Atalay İleri"]
         [joe "Joseph Tassarotti"]
         [adam "Adam Chlipala"]
         [haogang "Haogang Chen"]
         [frans "M. Frans Kaashoek"]
         [nickolai "Nickolai Zeldovich"]

         [pub-list
          (list
           (mk-pub "argosy:pldi2019"
                   #:title "Argosy: Verifying layered storage systems with recovery refinement"
                   #:conference (pldi 2019 #:to-appear? #t)
                   #:authors (list tej joe frans nickolai))
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
                                 @list{Student Research Competition at ACM Symposium on@;
           Operating System Principles}
                                 "SOSP 2017 SRC")
                   #:authors (list tej adam frans nickolai))
           (mk-pub "fscq:cacm2017"
                   #:title @list{Certifying a file system using Crash Hoare Logic:@br
           Correctness in the presence of crashes}
                   #:conference (mk-conference
                                 "Communications of the ACM"
                                 "CACM 2017")
                   #:authors (list tej haogang adam frans nickolai "Daniel Ziegler"))
           (mk-pub "fscq:sosp2015"
                   #:title "Using Crash Hoare Logic for certifying the FSCQ file system"
                   #:conference (sosp 2015)
                   #:authors (list haogang "Daniel Ziegler" tej adam frans nickolai))
           (mk-pub "amber:hotos2015"
                   #:title "Amber: Decoupling user data from web applications"
                   #:conference (mk-conference
                                 "Workshop on Hot Topics in Operating Systems"
                                 "HotOS 2015")
                   #:authors (list tej "Jon Gjengset" "Jelle van den Hooff"
                                   frans "James Mickens" "Robert Morris" nickolai))
           )])
    (map html/pub pub-list)))
