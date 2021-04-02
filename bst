#include <stdio.h>
#include<stdlib.h>

int count=0;
typedef struct node {
    int data;
    struct node *left;
    struct node *right;
}Node;


Node *createnode(int data){
    Node* temp = (Node*)malloc(sizeof(Node));
    temp->data = data;
    temp->left = temp->right = NULL;
    return temp;
}

Node *insert(Node *root, int data){
    
    //base condition
    if(root == NULL){
        Node* temp = createnode(data);
        root = temp;
    }
    //body
    else if(data > root->data)
        root->right=insert(root->right,data);//input change
    
    else
        root->left=insert(root->left,data);//input change
    
    return root;
}
//inorder
Node *find(Node *root, int val)
{	
    if(root==NULL)
		return root;
		
	else if (root->data==val)
		return root;
		
	else if(val>root->data)
		return find(root->right,val);
	else 
		return find(root->left,val);
}
void display(Node *root){
    //base condition
    if(root == NULL)
        return;
    //body
    
    display(root->left);
    printf("%d ",root->data);
    display(root->right);
    
    
}

Node *max(Node *root){
	if (root==NULL)
		return root;
	else if(root->right==NULL)
		return root;
	else 
		return max(root->right);
}

Node *minimum(Node *root){
	if (root==NULL)
		return root;
	else if(root->left==NULL)
		return root;
	else 
		return minimum(root->left);
}
//Inorder = Left root Right
//pre order= root left right
//post order= left right root
Node *deletenode (Node *root , int data) {
    
    if(root == NULL)
        return root;
        
    else if(data > root->data) 
        root->right = deletenode(root->right, data);
    
    else if (data < root->data) 
        root->left = deletenode(root->left, data);
        
    else {//when data == root->data
        //if only right child is present
        if(root->left == NULL) {
            Node *temp = root->right;
            free(root);
            return temp;
        }
        //if only left child is present
        else if(root->right == NULL) {
            Node *temp = root->left;
            free(root);
            return temp;
        }
        //if both child present
        
            
            Node *temp = minimum(root->right);
            root->data = temp->data;
            root->right= deletenode(root->right,temp->data);
        
    }
    return root;
    
}

void counter(Node *root){
	
	if(root == NULL)
	    return;
	
	if(root->left == NULL && root->right == NULL)
	    count++;
	
	if(root->left)
	    counter(root->left);
	
	if(root->right)
	    counter(root->right);
	
	/*
	if ((root->left==NULL)&&(root->right==NULL))
		 count++;
			
	else if ((root->left!=NULL)||(root->right!=NULL))
		count=count++;
		*/ 
	
		
}

int height (Node *root) {
    
    if(root == NULL)
        return 0;
    
    int lh = 1 + height(root->left);
    int rh = 1 + height(root->right);
    
    if(lh > rh)
        return lh;
    else
        return rh;
}
int main() {
    
    Node *root = NULL;
    
    root = insert(root,5);
    root = insert(root,4);
    root = insert(root,8);
    root = insert(root,10);
    root = insert(root,11);
    
    display(root);
    /*
    Node *search= find(root,5);
    printf("%d",search->data);
    */
    // Node *maxed=max(root);
    // printf("%d ",maxed->data);
    // Node *mined=minimum(root);
    // printf("%d ",mined->data);
    // counter(root);
    // printf("%d",count);
    printf("%d", height(root));
    
    return 0;
}
