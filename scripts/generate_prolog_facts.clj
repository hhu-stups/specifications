(defprotocol Prologalizable
  "Data that can be transformed to Prolog terms"
  (to-prolog [this] "function that converts data to Prolog"))


(extend-protocol
 Prologalizable

  Number
  (to-prolog [this] (str this))

  clojure.lang.Sequential
  (to-prolog [this]
    (str \[ 
         (clojure.string/join \, (map to-prolog this))
         \]))

  java.util.Set
  (to-prolog [this]
    (if-let [s (seq this)]
      (to-prolog (seq this))
      "[]"))

  clojure.lang.Keyword
  (to-prolog [this]
    (str \' (name this) \'))

  java.util.Map
  (to-prolog [this]
    (if-let [s (seq this)]
      (to-prolog (seq this))
      "[]"))

  clojure.lang.MapEntry
  (to-prolog [this]
    (str "bind("
         (to-prolog (key this))
         ","
         (to-prolog (val this))
         ")"))

  String
  (to-prolog [this]
    #_(str \'
         this
         \'
         )
    (to-prolog (map int this))
    )
  
  nil
  (to-prolog [this]
    "nil([])")

  Character
  (to-prolog [this]
    (str (int this)))
  
  ;; missing: symbols

  Boolean
  (to-prolog [this]
    (str "boolean("
         this
         ")")))

(defn generate-fact [functor & args]
  (str functor
       \(
       (clojure.string/join \, args)
       \)
       \.
       \newline))



(def META-INF-DIR (java.io.File. "../meta-information"))
(def meta-files (filter 
                  #(clojure.string/ends-with? (.getName %) ".edn")
                  (remove (fn [file] (.isDirectory file))
                        (file-seq META-INF-DIR))))

(defn read-meta-file [f] 
  (try (read-string (slurp f))
       (catch Exception e (println "error processing ") f)))

(def database
  (map read-meta-file meta-files))

(defn database-entry-to-prolog [index entry]
  (let [file (:file entry)
        ks (remove #{:comment} (keys entry))]
    (map (fn [k] (generate-fact (to-prolog k)
                                (to-prolog index) #_(to-prolog file) 
                                (to-prolog (get entry k)))) ks)))

(spit "database.pl" (clojure.string/join "" (sort (apply concat (map-indexed database-entry-to-prolog database)))))
