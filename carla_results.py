import numpy as np
import pandas as pd
from scipy.spatial.transform import Rotation as R


dataset_path_base = "/dataset/carla/Dataset_"
Autopass_path = "vrf/"
GT_end_to_end = "GT_end.txt"
GT_V_W= "V_W.txt"
Autopass_end_to_end_w_icp= "EtE_with_icp.txt"
Autopass_end_to_end_wo_icp= "EtE_without_icp.txt"
Autopass_V_W= "ndt.txt"

def error_cal(G_Pose, Pose, output_RTE, output_RRE, description):
    RTE=0
    RRE=0
    for k in range(len(G_Pose)):
        Pose_i = Pose[k].astype(np.float64)
        G_Pose_i=G_Pose[k].astype(np.float64)
        Pose_Trans=Pose_i[:-1,3]
        Pose_Rotat=Pose_i[:-1,:-1]
        G_Trans= G_Pose_i[:-1,3]
        G_Rotat= G_Pose_i[:-1,:-1]
        RTE_temp=np.linalg.norm(Pose_Trans-G_Trans)
        
        output_RTE.write(str(k))
        output_RTE.write(" ")
        output_RTE.write(str(RTE_temp))
        output_RTE.write ("\n")
        
        intermidate_RRE= R.from_matrix(np.dot(np.linalg.inv(G_Rotat),Pose_Rotat))
    
        a=intermidate_RRE.as_euler('zyx', degrees=True)
        RRE_temp=sum(abs(number) for number in a)
        
        output_RRE.write(str(k))
        output_RRE.write(" ")
        output_RRE.write(str(RRE_temp))
        output_RRE.write ("\n")
        
    output_RTE.close()
    output_RRE.close()


def compile_accuracy(path):
       RTE_w_icp = pd.read_csv(path+'RTE_w_icp.txt', sep = ' ', header = None, usecols=[1] , names =[ 'RTE_w_icp'])  
       RRE_w_icp = pd.read_csv(path+'RRE_w_icp.txt', sep = ' ', header = None, usecols=[1] ,names =[ 'RRE_w_icp'])  
       accuracy_df = pd.concat([RTE_w_icp, RRE_w_icp], axis = 1)
       accuracy_df['RTE_w_icp'] = accuracy_df['RTE_w_icp'] * 100
       return accuracy_df


for i in range(3):
    data_path = dataset_path_base + str(i+1) +"/"

    RTE_icp = open(data_path+"vrf/RTE_w_icp.txt", "w")
    RRE_icp = open(data_path+"vrf/RRE_w_icp.txt", "w")

    GT_Pose= open(data_path + GT_end_to_end, 'r').read().splitlines()
    GT_Pose= list(map(str.split, filter(lambda x: x != '4 4', GT_Pose)))
    GT_Pose = [np.array(GT_Pose[i:i+4]) for i in range(0, len(GT_Pose), 4)]

    Pose_icp = open(data_path + Autopass_path + Autopass_end_to_end_w_icp, 'r').read().splitlines()
    Pose_icp = list(map(str.split, filter(lambda x: x != '4 4', Pose_icp)))
    Pose_icp = [np.array(Pose_icp[i:i+4]) for i in range(0, len(Pose_icp), 4)]

    error_cal(GT_Pose, Pose_icp, RTE_icp, RRE_icp, "with_icp")


accuracy_dataset_1 = compile_accuracy(dataset_path_base +"1/vrf/")
accuracy_dataset_2 = compile_accuracy(dataset_path_base +"2/vrf/")
accuracy_dataset_3 = compile_accuracy(dataset_path_base +"3/vrf/")
accuracy_df = pd.concat([accuracy_dataset_1, accuracy_dataset_2, accuracy_dataset_3], ignore_index=True)


## ------------------------------------------------------------
## Accuracy results
## ------------------------------------------------------------


print('---------------------------------------------')
print('---------- Table 3 Carla accuracy ---------- ')
print('---------------------------------------------')
print(f"{'RTE(cm)':<10}{'':<10}{'':<10} | {'RRE(degree)':<10}{'':<10} {'':<10}")
print(f"{'mean':<10}{'p95':<10}{'p99':<10} | {'mean':<10}{'p95':<10}{'p99':<10}")
print(f"{(accuracy_df['RTE_w_icp'].mean()):<10.2f}{accuracy_df['RTE_w_icp'].quantile(0.95):<10.2f}{accuracy_df['RTE_w_icp'].quantile(0.99):<10.2f} \
| {(accuracy_df['RRE_w_icp'].mean()):<10.2f}{accuracy_df['RRE_w_icp'].quantile(0.95):<10.2f}{accuracy_df['RRE_w_icp'].quantile(0.99):<10.2f} ")



print('---------------------------------------------')
print('------------- Table 9 results--------------- ')
print('---------------------------------------------')
print(f"{'Traffic':<10} | {'Alignment Error':<10}{'':<10} ")
print(f"{'':<10} | {'RTE(cm)':<10}{'RRE(degree)':<10} ")
print(f"{'Low':<10} | {accuracy_dataset_2['RTE_w_icp'].mean():<10.2f}{accuracy_dataset_2['RRE_w_icp'].mean():<10.2f} ")
print(f"{'Medium':<10} | {accuracy_dataset_1['RTE_w_icp'].mean():<10.2f}{accuracy_dataset_2['RRE_w_icp'].mean():<10.2f} ")
print(f"{'High':<10} | {accuracy_dataset_3['RTE_w_icp'].mean():<10.2f}{accuracy_dataset_2['RRE_w_icp'].mean():<10.2f} ")






