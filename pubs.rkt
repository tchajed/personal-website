#lang at-exp racket

(require racket/format)
(require syntax/parse/define)
(require scribble/html)
(require "lib.rkt")

;; Publication data representations

(struct conf  (fullname short to-appear?))
(define/contract (mk-conference name short #:to-appear? [to-appear? #f])
  (->* (any/c string?)
       (#:to-appear? boolean?)
       conf?)
  (conf (format "~a (~a)" name short) short to-appear?))

(struct pub (key title conference slides? video-url authors)
  #:constructor-name mk-publication)
(define/contract (mk-pub
                  key
                  #:title title
                  #:conference conference
                  #:slides? [slides? #f]
                  #:video-url [video-url null]
                  #:authors authors)
  (->* (string?
        #:title any/c
        #:conference conf?
        #:authors (listof any/c))
       (#:slides? boolean?
        #:video-url (or/c string? null))
       pub?)
  (mk-publication key title conference slides? video-url authors))
(define (pub-published? pub)
  (not (conf-to-appear? (pub-conference pub))))

;; HTML formatting for publications

(define (html/conf conference)
  (-> conf? any/c)
  (let* ([short (conf-short conference)]
         [long (conf-fullname conference)]
         [abbrv-conf (if (equal? long "")
                       @short
                       (@abbr[title: long]{@short})
                       )])
    @span[class: "pub-conference"]{
 (@(if (conf-to-appear? conference)
       @list{conditionally accepted to @abbrv-conf}
       abbrv-conf))
 }))

(define/contract (html/pub-title pub)
  (-> pub? any/c)
  (let ([key (pub-key pub)]
        [title (pub-title pub)])
    @div{
 @span[class: "pub-title"]{
  @(if (pub-published? pub)
       (file-link @~a{papers/@|key|.pdf} title)
       title)
 }
 @nbsp
 @html/conf[(pub-conference pub)]
 }))

(define-simple-macro (ifdef cond:expr body:expr ...)
  (if cond (list body ...) ""))

(define/contract (html/pub-links pub)
  (-> pub? any/c)
  (let ([key (pub-key pub)])
    @ifdef[(pub-published? pub)]{
 @div[class: "pub-links"]{
  @file-link[@~a{papers/@|key|.pdf}]{
   @img[title: "Paper PDF" 'alt: "paper icon"
        src: "assets/file.svg" 'height: 16 'width: 16]
  }
  @ifdef[(pub-slides? pub)]{
   @file-link[@~a{papers/@|key|-slides.pdf}]{
    @img[title: "Slides" 'alt: "slides icon"
         src: "assets/slides.svg" 'height: 16 'width: 16]
  }}
  }}))

(define/contract (html/authors pub)
  (-> pub? any/c)
  (add-between (pub-authors pub) ", " #:before-last ", and "))

(define/contract (html/pub pub)
  (-> pub? any/c)
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
  (define (osdi year #:to-appear? (to-appear? #f))
    (let ([short @~a{OSDI @year}]
          [fullname @~a{USENIX Symposium on Operating System @;
            Design and Implementation}])
      (mk-conference fullname short #:to-appear? to-appear?)))

  (define (sosp year #:to-appear? (to-appear? #f))
    (let ([short @~a{SOSP @year}]
          [fullname @~a{ACM Symposium on Operating System @;
            Principles}])
      (mk-conference fullname short #:to-appear? to-appear?)))

  (define (usenix-security year)
    (let ([short @~a{USENIX Security @year}]
          [fullname @~a{USENIX Symposium on Security}])
      (mk-conference fullname short)))

  (define (pldi year #:to-appear? [to-appear? #f])
    (let ([short @~a{PLDI @year}]
          [fullname @~a{SIGPLAN Conference on Programming Language @;
            Design and Implementation}])
      (mk-conference fullname short #:to-appear? to-appear?)))

  (define (coqpl year #:to-appear? [to-appear? #f])
    (let ([short @~a{CoqPL @year}]
          [fullname @~a{International Workshop on Coq for @;
            Programming Languages}])
      (mk-conference fullname short #:to-appear? to-appear?)))

  (define (vldb year)
    (let ([short @~a{VLDB @year}]
          [fullname @~a{Very Large Databases Conference}])
      (mk-conference fullname short #:to-appear? #f)))

  (let* ([tej @span[class: "self-author"]{Tej Chajed}]
         [tej-non-bold "Tej Chajed"]
         [atalay "Atalay İleri"]
         [joe "Joseph Tassarotti"]
         [ralf "Ralf Jung"]
         [adam "Adam Chlipala"]
         [haogang "Haogang Chen"]
         [frans "M. Frans Kaashoek"]
         [nickolai "Nickolai Zeldovich"]
         [jonh "Jon Howell"]
         [andrea "Andrea Lattuada"]
         [oded "Oded Padon"]

         [pub-list
          (list
            (mk-pub "shadow-fs:hotstorage2024"
                    #:title "Shadow Filesystems: Recovering from Filesystem Runtime Errors via Robust Alternative Execution"
                    #:conference (mk-conference
                                   "ACM Workshop on Hot Topics in Storage and File Systems"
                                   "HotStorage 2024")
                    #:authors (list "Jing Liu" "Xiangpeng Hao" "Andrea Arpaci-Dusseau" "Remzi Arpaci-Dusseau" tej))
            (mk-pub "absint-fo:cav2024"
                    #:title "Efficient Implementation of an Abstract Domain of Quantified First-Order Formulas"
                    #:conference (mk-conference
                                   "Computer Aided Verification"
                                   "CAV 2024")
                    #:authors (list "Eden Frenkel" tej oded "Sharon Shoham"))
            (mk-pub "anvil:osdi2024"
                    #:title "Anvil: Verifying Liveness of Cluster Management Controllers"
                    #:conference (osdi 2024)
                    #:authors (list "Xudong Sun" "Wenjie Ma" "Jiawei Tyler Gu" "Zicheng Ma" tej jonh andrea oded "Lalith Suresh" "Adriana Szekeres" "Tianyin Xu"))
            (mk-pub "kondo:osdi2024"
                    #:title "Inductive Invariants That Spark Joy: Using Invariant Taxonomies to Streamline Distributed Protocol Proofs"
                    #:conference (osdi 2024)
                    #:authors (list "Tony Nuda Zhang" "Travis Hance" "Manos Kapritsos" tej "Bryan Parno"))
            (mk-pub "beyond-isolation:hotos2023"
                    #:title "Beyond isolation: OS verification as a foundation for correct applications"
                    #:conference (mk-conference
                                 "Workshop on Hot Topics in Operating Systems"
                                 "HotOS 2023")
                    #:authors (list "Matthias Brun" "Reto Achermann" tej jonh "Gerd Zellweger" andrea))
            (mk-pub "dbsp:vldb2023"
                    #:title "DBSP: Automatic Incremental View Maintenance for Rich Query Languages"
                    #:conference (vldb 2023)
                    #:authors (list "Mihai Budiu" tej "Frank McSherry" "Leonid Ryzhyk" "Val Tannen")
                    )
            (mk-pub "tchajed-thesis"
                    #:title "Verifying a concurrent, crash-safe file system with sequential reasoning"
                    #:conference (conf "" "Ph.D. Thesis, MIT, 2022" false)
                    #:slides? #t
                    #:authors (list tej))
           (mk-pub "daisy-nfs:osdi2022"
                   #:title @list{Verifying the DaisyNFS concurrent and crash-safe file system@br @;
                                 with sequential reasoning}
                   #:conference (osdi 2022)
                   #:slides? #t
                   #:authors (list tej joe "Mark Theng" frans nickolai)
            )
           (mk-pub "gojournal:osdi2021"
                   #:title "GoJournal: a verified, concurrent, crash-safe journaling system"
                   #:conference (osdi 2021)
                   #:authors (list tej joe "Mark Theng" ralf frans nickolai)
                   #:slides? #t
                   #:video-url "https://www.youtube.com/watch?v=bii1Jd0l_1M")
           (mk-pub "coq-record-update:coqpl2021"
                   #:title "Record Updates in Coq"
                   #:conference (coqpl 2021)
                   #:authors (list tej)
                   #:slides? #t
                   #:video-url "https://www.youtube.com/watch?v=T85e_xWXEig")
           (mk-pub "goose:coqpl2020"
                   #:title "Verifying concurrent Go code in Coq with Goose"
                   #:conference (coqpl 2020)
                   #:slides? #t
                   #:authors (list tej joe frans nickolai)
                   #:video-url "https://www.youtube.com/watch?v=RusKEgQK51c")
           (mk-pub "perennial:sosp2019"
                   #:title "Verifying concurrent, crash-safe systems with Perennial"
                   #:conference (sosp 2019)
                   #:slides? #t
                   #:video-url "https://sosp19.rcs.uwaterloo.ca/videos/D2-S1-P2.mp4"
                   #:authors (list tej joe frans nickolai))
           (mk-pub "everparse:usenix-sec2019"
                   #:title @list{EverParse: Verified Secure Zero-Copy Parsers for@br @;
           Authenticated Message Formats}
                   #:conference (usenix-security 2019)
                   #:authors (list "Tahina Ramananandro"
                                   "Antoine Delignat-Lavaud"
                                   "Cédric Fournet"
                                   "Nikhil Swamy"
                                   tej
                                   "Nadim Kobeissi"
                                   "Jonathan Protzenko"))
           (mk-pub "argosy:pldi2019"
                   #:title "Argosy: Verifying Layered Storage Systems with Recovery Refinement"
                   #:conference (pldi 2019)
                   #:slides? #t
                   #:authors (list tej joe frans nickolai)
                   #:video-url "https://www.youtube.com/watch?v=XAYcjPhfxVs&t=2s")
           (mk-pub "cspec:osdi2018"
                   #:title "Verifying concurrent software using movers in CSPEC"
                   #:conference (osdi 2018)
                   #:slides? #t
                   #:authors (list tej frans "Butler Lampson" nickolai)
                   #:video-url "https://www.usenix.org/conference/osdi18/presentation/chajed")
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
                                   adam frans nickolai)
                   #:video-url "https://dl.acm.org/ft_gateway.cfm?id=3132776&ftid=1938331&dwn=1")
           (mk-pub "cfscq:sosp2017-src"
                   #:title "Extending a verified file system with concurrency"
                   #:slides? #t
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
                   #:authors (list tej-non-bold haogang adam frans nickolai "Daniel Ziegler"))
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
