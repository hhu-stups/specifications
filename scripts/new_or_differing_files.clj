(require 'digest)

(def ROOT-DIR "../")
(def EXAMPLE-DIR  (str ROOT-DIR "prob-examples/"))
(def META-INF-DIR (str ROOT-DIR "meta-information/"))

(def RECOGNIZED-FILES #{".mch" ".eventb"})


(def current-files (filter (fn [file]
                               (some (fn [file-extension] (.endsWith (.getName file) file-extension)) RECOGNIZED-FILES))
                           (file-seq (java.io.File. EXAMPLE-DIR))))

(defn corresponding-edn-file [file]
  (let [relative-path (subs (.getPath file) (count ROOT-DIR))
        edn-path (str META-INF-DIR relative-path ".edn")
        edn-file (java.io.File. edn-path)]
    edn-file))

(defn edn-exists? [file]
  (.exists (corresponding-edn-file file)))

(defn sha-matches? [file]
  (let [data (read-string (slurp (corresponding-edn-file file)))
        sha (:sha256 data)
        current-sha (digest/sha-256 file)]
    (= current-sha sha)))

(def filesies (filter (fn [file]
                   (or (not (edn-exists? file))
                       (not (sha-matches? file))))
                 current-files))

(println (clojure.string/join \newline (map (fn [file] (.getCanonicalPath file)) filesies)))

