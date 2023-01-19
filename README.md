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

For more information explaining the two methods above, click the following link. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3489527/

#### Results

![a23ca992-1495-4e28-93ae-3edb6c8af1cd](https://user-images.githubusercontent.com/104226913/213523669-56737dfb-605b-472d-a22c-2dcc9821c3cf.png)

![95fc6211-5ad1-4f14-a90f-f8feb948d926](https://user-images.githubusercontent.com/104226913/213523699-804ce11c-7991-4146-9064-2732609b3244.png)

![46d90856-da91-4c52-800d-c38e3d5aaaaa](https://user-images.githubusercontent.com/104226913/213523712-74635de0-996f-45e0-ad9b-bb93c9f7e03f.png)



