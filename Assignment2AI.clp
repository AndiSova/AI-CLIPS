(deftemplate beef-cut
   (multislot name)
   (multislot cook-style))

(deffacts beef-cuts
   (beef-cut (name sirloin steak)
             (cook-style broil pan-broil pan-fry))
   (beef-cut (name round steak)
             (cook-style braise))
   (beef-cut (name t-bone steak)
             (cook-style broil pan-broil pan-fry))
   (beef-cut (name rib roast)
             (cook-style roast))
   (beef-cut (name ground beef)
             (cook-style roast broil pan-broil pan-fry braise))
   (beef-cut (name flank steak)
             (cook-style braise))
   (beef-cut (name rump roast)
             (cook-style braise roast)))
   
(defrule select-cooking-style-or-cut
   =>
   (printout t "Select cut of beef or method of cooking? ")
   (assert (select (read))))

(defrule select-cooking-style
   (select method)
   =>
   (printout t "Which way to cook? ")
   (assert (method (read))))

(defrule select-cut
   (select cut)
   =>
   (printout t "Which cut you want to cook? ")
   (assert (cut (explode$ (readline)))))

(defrule list-cuts-to-cook
   (method ?method)
   (beef-cut (name $?cut) (cook-style $? ?method $?))
   =>
   (printout t "You can " ?method " " (implode$ ?cut) "." crlf))

(defrule list-cook-styles
   (cut $?cut)
   (beef-cut (name $?cut) (cook-style $? ?method $?))
   =>
   (printout t "You can " ?method " " (implode$ ?cut) "." crlf))

