;; setup paths
(def ROOT-DIR "../")
(def META-INF-DIR (java.io.File. (str ROOT-DIR "/meta-information")))

;; get a sequence of all meta-information files in the directory
(def meta-files (remove (fn [file] (.isDirectory file)) (file-seq META-INF-DIR)))

(defn read-meta-file [f]
  (read-string (slurp f)))

(spit
  "parseable-eventb-machines"
  (clojure.string/join \newline
                       (->> meta-files
                            (map read-meta-file)
                            (filter (fn [data]
                                      (and 
                                        (= (:formalism data) :eventb)
                                        (not (empty? (:included-machines data))))))
                            (map :file))))

(spit
  "parseable-b-machines"
  (clojure.string/join \newline
                       (->> meta-files
                            (map read-meta-file)
                            (filter (fn [data]
                                      (and 
                                        (= (:formalism data) :b)
                                        (not (empty? (:included-machines data))))))
                            (map :file))))
