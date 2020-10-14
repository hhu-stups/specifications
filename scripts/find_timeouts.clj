#!/usr/bin/env clojure

(def META-INF-DIR (java.io.File. "../meta-information"))

;; get a sequence of all meta-information files in the directory
(def meta-files (remove (fn [file] (.isDirectory file))
                        (file-seq META-INF-DIR)))

(defn read-meta-file [f] (read-string (slurp f)))

(defn timeout? [data]
  (let [runs (:runs data)
        mc-times (map :model-checking-time runs)]
    (some #{:timeout} mc-times)))


(def timeout-files
  (->> meta-files
       (map read-meta-file)
       (filter (fn [data]
                 (and (= (:formalism data) :b)
                      (timeout? data))))
       (map :file)))

(doseq [file-name timeout-files]
  (println file-name))
