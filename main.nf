#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process dragen {
    label 'dragen'

    secret 'DRAGEN_USERNAME'
    secret 'DRAGEN_PASSWORD'

  output:
    stdout

script:
"""

/opt/edico/bin/dragen -f -r s3://aws-batch-tower/quickstart/hg19-cnv-anchored.v8.tar -1 s3://aws-batch-tower/quickstart/NA24385-AJ-Son-R1-NS_S33_L001_R1_001.fastq.gz -2 s3://aws-batch-tower/quickstart/NA24385-AJ-Son-R1-NS_S33_L001_R2_001.fastq.gz --enable-map-align-output true --enable-sort true --output-file-prefix outputs --enable-map-align true --output-format BAM --output-directory s3://aws-batch-tower/quickstart/output/ --enable-variant-caller true

}

workflow {
    dragenCall | view
}
