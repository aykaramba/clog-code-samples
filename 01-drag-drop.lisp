
;; (defpackage #:01-drag-drop
;;   (:use #:cl #:clog )
;;   (:export start-app))

;; (in-package :01-drag-drop)


(in-package :clog-code-samples)



(defun drag-drop (body)
  
  (let* (
         ;; (app (make-instance 'app-data))
         ;; containers
         (container-main (create-div body :content "" :class "w3-container w3-red w3-margin"))
         (container-target-01 (create-div container-main :class "w3-yellow w3-padding w3-third w3-center w3-margin-top w3-margin-bottom"))
         (container-target-02 (create-div container-main :class "w3-yellow w3-padding w3-third w3-center w3-margin-top w3-margin-bottom w3-leftbar w3-rightbar w3-border-red"))
         (container-target-03 (create-div container-main :class "w3-yellow w3-padding w3-third w3-center w3-margin-top w3-margin-bottom"))
         ;; draggable objects
         (object01 (create-div body :content "draggable - object 01" :class "w3-light-blue  w3-quarter w3-padding"))
         (object02 (create-div body :content "draggable - object 02" :class "w3-light-gray  w3-quarter w3-padding"))
         (object03 (create-div body :content "draggable - object 03" :class "w3-light-green  w3-quarter w3-padding"))
         (object04 (create-div body :content "draggable - object 04" :class "w3-pale-yellow  w3-quarter w3-padding"))
         )

    ;;-------------------
    ;; *
    ;;--
    ;; (setf (connection-data-item body "app-data") app)
    (setf (title (html-document body)) "Drag and Drop3")
    ;; (clog-gui-initialize body)
    (add-class body "w3-teal")
    (setf (height container-target-01) 250)
    (setf (height container-target-02) 250)
    (setf (height container-target-03) 250)
    (create-div container-target-01 :content "<b>~-- TARGET 01 --~</b>" )
    (create-div container-target-02 :content "<b>~-- TARGET 02 --~</b>" )
    (create-div container-target-03 :content "<b>~-- TARGET 03 --~</b>" )
    (load-css (html-document body) "https://www.w3schools.com/w3css/4/w3.css")

    
    (let* (
           (item-drop-01 object01)
           (item-drop-02 object02)
           (item-drop-03 object03)
           (item-drop-04 object04)
           (target-01 container-target-01)
           (target-02 container-target-02)
           (target-03 container-target-03)
           )

      ;; -------------------
      ;; item-drop-01
      ;; --
      (setf (draggablep item-drop-01)  t )
      (set-on-drag-start item-drop-01 (lambda (obj)(declare (ignore obj))()) :drag-data "1")
       
      ;; -------------------
      ;; item-drop-02
      ;; --
      (setf (draggablep item-drop-02)  t )
      (set-on-drag-start item-drop-02 (lambda (obj)(declare (ignore obj))()) :drag-data "2")
      
      ;; -------------------
      ;; item-drop-03
      ;; --
      (setf (draggablep item-drop-03)  t )
      (set-on-drag-start item-drop-03 (lambda (obj)(declare (ignore obj))()) :drag-data "3")
      
      ;; -------------------
      ;; item-drop-04
      ;; --
      (setf (draggablep item-drop-04)  t )
      (set-on-drag-start item-drop-04 (lambda (obj)(declare (ignore obj))()) :drag-data "4")

      ;; -------------------
      ;; set target for all
      ;; --
      (set-on-drag-over target-01 (lambda (obj)(declare (ignore obj))()))
      (set-on-drag-over target-02 (lambda (obj)(declare (ignore obj))()))
      (set-on-drag-over target-03 (lambda (obj)(declare (ignore obj))()))

      ;; -------------------
      ;; drop for target-01
      ;; --
      (set-on-drop target-01 
                   (lambda (obj data)
                     (declare (ignore obj))
                     (print (getf data :drag-data))
                     (force-output)
                     (cond 
                       ((string= (getf data :drag-data) "1")
                        (place-inside-bottom-of target-01 item-drop-01)
                        (setf (css-class-name item-drop-01) "w3-pink w3-margin"))
                       ((string= (getf data :drag-data) "2")
                        (place-inside-bottom-of target-01 item-drop-02)
                        (setf (css-class-name item-drop-02) "w3-pink w3-margin"))
                       ((string= (getf data :drag-data) "3")
                        (place-inside-bottom-of target-01 item-drop-03)
                        (setf (css-class-name item-drop-03) "w3-pink w3-margin"))
                       ((string= (getf data :drag-data) "4")
                        (place-inside-bottom-of target-01 item-drop-04)
                        (setf (css-class-name item-drop-04) "w3-pink w3-margin"))
                       (t ()))
                     ))

      ;; -------------------
      ;; drop for target-02
      ;; --
      (set-on-drop target-02 
                   (lambda (obj data)
                     (declare (ignore obj))
                     (print (getf data :drag-data))
                     (force-output)
                     (cond 
                       ((string= (getf data :drag-data) "1")
                        (place-inside-bottom-of target-02 item-drop-01)
                        (setf (css-class-name item-drop-01) "w3-deep-orange w3-margin"))
                       ((string= (getf data :drag-data) "2")
                        (place-inside-bottom-of target-02 item-drop-02)
                        (setf (css-class-name item-drop-02) "w3-deep-orange w3-margin"))
                       ((string= (getf data :drag-data) "3")
                        (place-inside-bottom-of target-02 item-drop-03)
                        (setf (css-class-name item-drop-03) "w3-deep-orange w3-margin"))
                       ((string= (getf data :drag-data) "4")
                        (place-inside-bottom-of target-02 item-drop-04)
                        (setf (css-class-name item-drop-04) "w3-deep-orange w3-margin"))
                       (t ()))
                     ))

      ;; -------------------
      ;; drop for target-03
      ;; --
      (set-on-drop target-03 
                   (lambda (obj data)
                     (declare (ignore obj))
                     (print (getf data :drag-data))
                     (force-output)
                     (cond 
                       ((string= (getf data :drag-data) "1")
                        (place-inside-bottom-of target-03 item-drop-01)
                        (setf (css-class-name item-drop-01) "w3-blue-gray w3-margin"))
                       ((string= (getf data :drag-data) "2")
                        (place-inside-bottom-of target-03 item-drop-02)
                        (setf (css-class-name item-drop-02) "w3-blue-gray w3-margin"))
                       ((string= (getf data :drag-data) "3")
                        (place-inside-bottom-of target-03 item-drop-03)
                        (setf (css-class-name item-drop-03) "w3-blue-gray w3-margin"))
                       ((string= (getf data :drag-data) "4")
                        (place-inside-bottom-of target-03 item-drop-04)
                        (setf (css-class-name item-drop-04) "w3-blue-gray w3-margin"))
                       (t ()))
                     ))
      )))

;; ;; -------------------
;; ;; start app
;; ;; --
;; (defun start-app ()
;;   (initialize 'on-new-window
;;               :static-root (merge-pathnames "./www/"
;;                                             (asdf:system-source-directory :todo-04)))
;;   (open-browser))
