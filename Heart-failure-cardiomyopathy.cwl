cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  endocardial-heart-failure-cardiomyopathy---icduncat:
    run: endocardial-heart-failure-cardiomyopathy---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  hypertrophic-heart-failure-cardiomyopathy---icduncat:
    run: hypertrophic-heart-failure-cardiomyopathy---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: endocardial-heart-failure-cardiomyopathy---icduncat/output
  obstructive-heart-failure-cardiomyopathy---icduncat:
    run: obstructive-heart-failure-cardiomyopathy---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: hypertrophic-heart-failure-cardiomyopathy---icduncat/output
  other-heart-failure-cardiomyopathy---icduncat:
    run: other-heart-failure-cardiomyopathy---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: obstructive-heart-failure-cardiomyopathy---icduncat/output
  heart-failure-cardiomyopathy---icduncat:
    run: heart-failure-cardiomyopathy---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: other-heart-failure-cardiomyopathy---icduncat/output
  heart-failure-cardiomyopathy-fibroelastosis---icduncat:
    run: heart-failure-cardiomyopathy-fibroelastosis---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: heart-failure-cardiomyopathy---icduncat/output
  primary-heart-failure-cardiomyopathy---icduncat:
    run: primary-heart-failure-cardiomyopathy---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: heart-failure-cardiomyopathy-fibroelastosis---icduncat/output
  alcoholic-heart-failure-cardiomyopathy---icduncat:
    run: alcoholic-heart-failure-cardiomyopathy---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: primary-heart-failure-cardiomyopathy---icduncat/output
  heart-failure-cardiomyopathy-unspecified---icduncat:
    run: heart-failure-cardiomyopathy-unspecified---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: alcoholic-heart-failure-cardiomyopathy---icduncat/output
  heart-failure-cardiomyopathy-includes---icduncat:
    run: heart-failure-cardiomyopathy-includes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: heart-failure-cardiomyopathy-unspecified---icduncat/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: heart-failure-cardiomyopathy-includes---icduncat/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
