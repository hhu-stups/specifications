(def META-INF-DIR (java.io.File. "../meta-information"))

;; get a sequence of all meta-information files in the directory
(def meta-files (remove (fn [file] (.isDirectory file))
                        (file-seq META-INF-DIR)))

(defn read-meta-file [f] (read-string (slurp f)))

(defn larger-models [n]
  (->> meta-files
       (map read-meta-file)
       (filter (fn [data]
                 (and (= (:formalism data) :b)
                      (number? (:number-of-states data))
                      (>= (:number-of-states data) n)
                      (not (:invariant-violated data)))))
       (map :file)))
