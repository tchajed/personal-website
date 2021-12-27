#lang at-exp racket

(require scribble/html)

(define (file-link fname text)
  (let ([path (build-path "docs" fname)])
    (unless (file-exists? path)
      (raise-user-error @~a{attempt to link to non-existent file @path})))
  (a 'href: fname text))
(provide file-link)
