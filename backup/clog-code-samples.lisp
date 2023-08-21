(defpackage #:clog-code-samples
  (:use #:cl #:clog)
  (:export start-app))

(in-package :clog-code-samples)

(defun on-new-window (body)

  ;; ------------------
  ;; set the page title
  ;; ---
  (setf (title (html-document body)) "Tutorial 04")

  
  ;; Use the panel-box-layout to center horizontally
  ;; and vertically our div on the screen.
  (let* ((layout (create-panel-box-layout body)))
    (center-children (center-panel layout))
    (create-div (center-panel layout) :content "Hello")))

(defun start-app ()
  (initialize 'on-new-window
   :static-root (merge-pathnames "./www/"
                  (asdf:system-source-directory :clog-code-samples)))
  (open-browser))
