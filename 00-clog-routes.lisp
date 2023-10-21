
(in-package :clog-code-samples)

(defun clog-routes (body)
  (load-css (html-document body) "https://www.w3schools.com/w3css/4/w3.css")
  (setf (title (html-document body)) "CLOG - Code Samples")
  (let* (
         ;; ------------------
         ;; containers
         ;; ---
         (padding-left (create-div body :content "&nbsp;" :class "w3-quarter"))
         (container-main (create-div body :content "&nbsp;" :class "w3-container w3-monospace w3-half"))
         (padding-right (create-div body :content "&nbsp;" :class "w3-quarter"))
         (container-title (create-div container-main :content "<b> Sample 00 - Basic Routes </b>" :class "w3-container w3-center w3-margin-bottom"))
         (container-links (create-div container-main :class "w3-center w3-text-gray"))
         )
         ;; ------------------
         ;; content
         ;; ---
         (create-div container-links :class "w3-margin-bottom w3-padding " :content "Here is the code from clog-code-samples.lisp demonstrating routes assignment:")
    
         (create-div container-links :class "w3-left-align" :content
                     
"<code><pre>

(defun start-app ()
(initialize 'on-new-window 
    :static-root (merge-pathnames \"./www/\" 
                    (asdf:system-source-directory :clog-code-samples)))
(set-on-new-window 'clog-routes :path \"/00-clog-routes\")
(set-on-new-window 'drag-drop :path \"/01-drag-drop\")
(open-browser))

</pre></code>

         ")))
