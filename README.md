# Proteomics

## Original Spreadsheets
Holds original spreadsheets from proteomics experiment in a denormalized form. 

## SQL
Holds python and sql files to normalize and create a database for the proteomics.

## Entity Relationship Diagram (ERD)
Shows how database in connected.
![Proteins drawio](https://user-images.githubusercontent.com/104226913/212421498-6ed8f493-d52d-44bb-bf12-65cb74003b9f.png)

## Protein Visuals
Holds visuals created by utilizing database with specified queries.

## Visual Examples

### Box-and-Whisker Plots
![image](https://user-images.githubusercontent.com/104226913/212423238-197afc48-8b81-4db7-9c8b-f5f9c7b1ef2a.png)

![image](https://user-images.githubusercontent.com/104226913/212423256-9861cdf9-c313-411c-9190-1d71e95bf4ec.png)

### Cluster Heat Maps
Cluster heatmaps are commonly used in biology and related fields to reveal hierarchical clusters in data matrices. Heatmaps visualize a data matrix by drawing a rectangular grid corresponding to rows and columns in the matrix, and coloring the cells by their values in the data matrix. The process of running hierarchical clustering on a data matrix usually produces two separate but related datasets: a data matrix that has been reordered based on the clustering results, and trees representing the hierarchical clustering results. A cluster heatmap visualizes the reordered data matrix with a heatmap and the trees separately as dendrograms in the margins.

#### Methods Used
A distance metric is a non-negative number which measures the difference between two objects. A value of 0 denotes no difference, with higher values corresponding to larger differences. The most common measure of distance calculates the difference in location, with 0 indicating that the two objects are at the same location. This is known as Euclidean distance, and is the default for all heat map functions.

Euclidean Distance: $ED(x,y) = sqrt((x_1 - y_1)^2 + ... + (x_n - y_n)^2)$

The Ward Minimization algoithim is where $u$ is the newly joined cluster consisting od $s$ and $t$, $v$ is an unused cluster in the forest $T = |v| + |s| + |t|$, and $| * |$ is the cardinality of its argument. This is also known as the increment algorithm. 

Ward Minimization Algorithim: $d(u, v) = sqrt( ((|v|+|s|)/T)d(v,s)^2 + ((|v|+|t|)/T)d(v,t)^2 - (|v|/T)d(s,t)^2)$

For more information explaining the two methods above, click the following links. 

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3489527/

https://docs.scipy.org/doc/scipy/reference/generated/scipy.cluster.hierarchy.linkage.html#scipy.cluster.hierarchy.linkage

#### Results
![51c6c885-1626-42e3-9604-7614b5f4e53f](https://user-images.githubusercontent.com/104226913/213570213-127af06d-1219-4683-956a-ca4d2300da7d.png)
![f1b36f7c-6e88-4998-b043-83fe7dff6fdd](https://user-images.githubusercontent.com/104226913/213570245-2bec343d-fd5e-4eb6-852d-ab4641be768d.png)
![4e8335be-ee97-49d7-aa2c-d37202d3949b](https://user-images.githubusercontent.com/104226913/213570268-62e1f76a-5f0b-451f-8089-ad62a241fea5.png)
![7d0ba649-1510-43f4-af98-71e28281fba0](https://user-images.githubusercontent.com/104226913/213570284-a15c4631-ec68-4607-8ee5-feb3bad80dd8.png)

