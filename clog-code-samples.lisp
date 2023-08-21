(defpackage #:clog-code-samples
  (:use #:cl #:clog)
  (:export start-app))

(in-package :clog-code-samples)

;; ------------------
;; page layout
;; ---
(defun on-new-window (body)
  (load-css (html-document body) "https://www.w3schools.com/w3css/4/w3.css")
  (setf (title (html-document body)) "CLOG - Code Samples")
  (let* (
         ;; ------------------
         ;; containers
         ;; ---
         (padding-left (create-div body :content "&nbsp;" :class "w3-quarter"))
         (container-main (create-div body :content "&nbsp;" :class "w3-container w3-monospace w3-half"))
         (padding-right (create-div body :content "&nbsp;" :class "w3-quarter"))
         (container-title (create-div container-main :content "<b> *** CLOG - Code Samples *** </b>" :class "w3-container w3-center w3-margin-bottom"))
         (container-links (create-div container-main :class "w3-center w3-text-gray"))
         )
    ;; ------------------
    ;; content
    ;; ---
    (create-div container-links :content "<a href='/01-drag-drop'>01 - Drag and Drop</a>" )
    (create-div container-links :class "w3-margin-bottom w3-padding" :content "This sample is based on the code from 18-tutorial.lisp example. This example provides 3 target drop areas, multiple draggable objects, allows for dragging between targets and shows how we can use w3css classes to change object properties on drop. " )
    ))

;; ------------------
;; start + routes
;; ---
(defun start-app ()
  (initialize 'on-new-window
              :static-root (merge-pathnames "./www/"
              (asdf:system-source-directory :clog-code-samples)))
  (set-on-new-window 'drag-drop :path "/01-drag-drop")
  (open-browser))

