# New RNAseq Pipeline

The whole RNAseq analysis can be roughly divided into three steps:
<ol>
  <li>Quality control (sequence check, de-multiplex, etc.)</li>
  <li>Count reads (alignment, assembly, annotation, etc.)</li>
  <li>Interpret data (statistical test, visualization, pathway analysis, etc.)</li>
</ol>

**Short Version** (only care about known transcripts present in GTF file) Also note that we use HISAT instead of TopHat:
![alt text][short-pipeline]

[short-pipeline]: https://cloud.githubusercontent.com/assets/12090136/9558325/0de2342c-4d99-11e5-82b0-31eb90a4a629.png

**Long Version** (when we care about novel transcripts) Again we use HISAT, not TopHat:
![alt text][long-pipeline]

[long-pipeline]: https://cloud.githubusercontent.com/assets/12090136/9558326/0de22fea-4d99-11e5-8f23-3b851bbfaa53.png
