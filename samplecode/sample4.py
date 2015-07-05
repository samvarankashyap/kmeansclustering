import csv
import pylab
from numpy import vstack,array
from numpy.random import rand
from scipy.cluster.vq import kmeans,vq
import random

field_names = ['Report No.','Report Date','Sent to Manufacturer / Importer / Private Labeler','Publication Date','Category of Submitter','Product Description','Product Category','Product Sub Category','Product Type','Product Code','Manufacturer / Importer / Private Labeler Name','Brand','Model Name or Number','Serial Number','UPC','Date Manufactured','Manufacturer Date Code','Retailer','Retailer State','Purchase Date','Purchase Date Is Estimate','Incident Description','City','State','ZIP','Location','(Primary) Victim Severity','(Primary) Victims Gender','My Relation To The (Primary) Victim','(Primary) Victims Age (years)','Submitter Has Product','Product Was Damaged Before Incident','Damage Description','Damage Repaired','Product Was Modified Before Incident','Have You Contacted The Manufacturer','If Not Do You Plan To','Answer Explanation','Company Comments','Associated Report Numbers']
print len(field_names)
csvfile = open("Consumer.csv","r")
reader = csv.DictReader(csvfile, fieldnames=field_names)


# getting all the unique fields::;
def get_unique_lists(x_param, y_param):
    x_list = []
    y_list = []
    vector = []
    for row in reader:
        vector_element = [] 
        #print(row['Report No.'], row['Report Date'])
        x_list.append(row[x_param])
        y_list.append(row[y_param])
        vector_element.append(row[x_param])
        vector_element.append(row[y_param])
        vector.append(vector_element)
    x_list = list(set(x_list))
    y_list = list(set(y_list))
    return x_list,y_list,vector

# convert vector to decimal points 
def get_decimal_vector(x_list,y_list,vector):
    d_vector = []
    for element in vector:
        x_index= x_list.index(element[0])
        #print x_index
        y_index = y_list.index(element[1])
        #print y_index
        d_vector_ele = []
        jitter = [random.random() for _ in range(0, 1)][0]
        d_vector_ele.append(x_index+jitter)
        d_vector_ele.append(y_index+jitter)
        d_vector.append(d_vector_ele)
    return d_vector

def vector_to_image(d_vector):
    #data = array(d_vector)
    data = vstack(d_vector)
    # computing K-Means with K = 2 (2 clusters)
    centroids,_ = kmeans(data,2)
    # assign each sample to a cluster
    idx,_ = vq(data,centroids)
    # some plotting using numpy's logical indexing
    #pylab.plot(data[idx==0,0],data[idx==0,1],'ob',
    #     data[idx==1,0],data[idx==1,1],'or')
    pylab.plot(data[idx==0,0],data[idx==0,1],'ob',
         data[idx==1,0],data[idx==1,1],'or',markersize=2,marker='o')
    pylab.plot(centroids[:,0],centroids[:,1],'sg',markersize=12,marker='o')
    #pylab.plot(centroids[:,0],centroids[:,1],centroids[:,2],'sg',markersize=1)
    pylab.savefig("./consumer_cluster.png")

x_list,y_list,vector = get_unique_lists('Product Type','City')
d_vector = get_decimal_vector(x_list,y_list,vector)
vector_to_image(d_vector)

