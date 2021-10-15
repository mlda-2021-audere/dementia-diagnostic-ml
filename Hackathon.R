library(data.table)
library(rpart)
library(rpart.plot)  

table=fread("oasis_longitudinal.csv")
set.seed(2)
table
summary(table)

table$Group=factor(table$Group)
df=table[!table$Group=="Converted"]

summary(df)
df$Group=factor(df$Group)

df1=df[,.(`Subject ID`,Group,`M/F`,Age,EDUC,MMSE)]

summary(df1)

df1$`M/F`=factor(df1$`M/F`)

#cart

cart=rpart(Group ~ `M/F`+Age+EDUC+MMSE, data = df1, method = 'class',
           control = rpart.control(minsplit = 2, cp = 0))

printcp(cart)
plotcp(cart, main = "Subtrees in cart")

CVerror.cap <- cart$cptable[which.min(cart$cptable[,"xerror"]), "xerror"] + cart$cptable[which.min(cart$cptable[,"xerror"]), "xstd"]

# Find the optimal CP region whose CV error is just below CVerror.cap in maximal tree cart1.
i <- 1; j<- 4
while (cart$cptable[i,j] > CVerror.cap) {
  i <- i + 1
}

# Get geometric mean of the two identified CP values in the optimal region if optimal tree has at least one split.
cp.opt = ifelse(i > 1, sqrt(cart$cptable[i,1] * cart$cptable[i-1,1]), 1)

cart1 <- prune(cart, cp = cp.opt-0.07)

rpart.plot(cart1, nn = T, main = "Optimal Tree in cart")

cart1$variable.importance

summary(cart1)

#logistic regression

which(is.na(df1$MMSE))
df1=df1[-c(321,322)]

levels(df1$Group)


pass = glm(Group ~ `M/F`+Age+EDUC+MMSE,family=binomial,data = df1)
summary(pass)

prob <- predict(pass, type = 'response')

threshold <- 0.5

y.hat <- ifelse(prob > threshold, "Nondemented", "Demented")


table(df1$Group, y.hat, deparse.level = 2)

mean(y.hat == df1$Group)


