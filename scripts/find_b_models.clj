(def META-INF-DIR (java.io.File. "../meta-information"))

;; get a sequence of all meta-information files in the directory
(def meta-files (filter 
                  #(clojure.string/ends-with? (.getName %) ".edn")
                  (remove (fn [file] (.isDirectory file))
                        (file-seq META-INF-DIR))))

(defn read-meta-file [f] (read-string (slurp f)))

(->> meta-files
     (map read-meta-file)
     (filter (fn [data]
               (and (= (:formalism data) :b)
                    (number? (:number-of-states data)))
                    ))
     (map :file))
