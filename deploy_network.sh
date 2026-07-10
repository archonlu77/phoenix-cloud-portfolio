#!/bin/bash
# ==============================================================================
# PHOENIX MASTER PROTOCOL - WEEK 1 AUTOMATION ENGINE
# TARGET: 2-TIER HIGH AVAILABILITY / ENTERPRISE BLUEPRINT OUTLINE
# SYSTEM DATE: Friday, July 10, 2026
# ==============================================================================

set -e # Terminate script immediately if any command returns a non-zero exit code

echo "========================================================================"
echo "🦅 INITIATING PHOENIX CLOUD ARCHITECTURE FABRIC PROVISIONING MODULE..."
echo "========================================================================"

# 1. CORE PARAMETERS & ADDRESS POOLS
VPC_CIDR="10.0.0.0/16"
PUBLIC_SUBNET_CIDR="10.0.1.0/24"
PRIVATE_SUBNET_CIDR="10.0.2.0/24"
REGION="us-east-1"

echo "⚡ Step 1: Generating Core VPC Boundary ($VPC_CIDR)..."
VPC_ID=$(aws ec2 create-vpc \
    --cidr-block "$VPC_CIDR" \
    --query 'Vpc.VpcId' \
    --output text)
echo " VPC Provisioned Successfully: $VPC_ID"

# Enable DNS support frameworks within the core node
aws ec2 modify-vpc-attribute --vpc-id "$VPC_ID" --enable-dns-support "{\"Value\":true}"
aws ec2 modify-vpc-attribute --vpc-id "$VPC_ID" --enable-dns-hostnames "{\"Value\":true}"

# 2. SUBNET CARVING SEQUENCES
echo "⚡ Step 2: Carving Network Tiers..."
PUBLIC_SUBNET_ID=$(aws ec2 create-subnet \
    --vpc-id "$VPC_ID" \
    --cidr-block "$PUBLIC_SUBNET_CIDR" \
    --query 'Subnet.SubnetId' \
    --output text)
echo " Tier-1 Public Subnet Live: $PUBLIC_SUBNET_ID"

PRIVATE_SUBNET_ID=$(aws ec2 create-subnet \
    --vpc-id "$VPC_ID" \
    --cidr-block "$PRIVATE_SUBNET_CIDR" \
    --query 'Subnet.SubnetId' \
    --output text)
echo " Tier-2 Private Subnet Live: $PRIVATE_SUBNET_ID"

# 3. EDGE TRANSIT INTERFACE
echo "⚡ Step 3: Provisioning Edge Interfaces..."
IGW_ID=$(aws ec2 create-internet-gateway \
    --query 'InternetGateway.InternetGatewayId' \
    --output text)
echo " Edge Gateway Generated: $IGW_ID"

aws ec2 attach-internet-gateway --vpc-id "$VPC_ID" --internet-gateway-id "$IGW_ID"
echo " Gateway Linked to VPC Perimeter."

# 4. ONE-WAY MIRROR (NAT) TRANSIT CORE
echo "⚡ Step 4: Allocating Static Elastic IP & Spinning NAT Gateway..."
ALLOCATION_ID=$(aws ec2 allocate-address \
    --domain vpc \
    --query 'AllocationId' \
    --output text)
echo " Public Elastic IP Bound: $ALLOCATION_ID"

echo "⏳ Instantiating NAT Gateway interface (This requires an active hypervisor initialization loop)..."
NAT_GW_ID=$(aws ec2 create-nat-gateway \
    --subnet-id "$PUBLIC_SUBNET_ID" \
    --allocation-id "$ALLOCATION_ID" \
    --query 'NatGateway.NatGatewayId' \
    --output text)
echo " NAT Interface Active: $NAT_GW_ID"

# 5. ROUTING ROUTINES & EXPLICIT SUB-TIER ASSIGNMENTS
echo "⚡ Step 5: Structuring Routing Tables & Injecting Transit Rules..."

# A. Public Table Custom Assembly
PUBLIC_RT_ID=$(aws ec2 create-route-table \
    --vpc-id "$VPC_ID" \
    --query 'RouteTable.RouteTableId' \
    --output text)
aws ec2 create-route --route-table-id "$PUBLIC_RT_ID" --destination-cidr-block 0.0.0.0/0 --gateway-id "$IGW_ID" > /dev/null
aws ec2 associate-route-table --subnet-id "$PUBLIC_SUBNET_ID" --route-table-id "$PUBLIC_RT_ID" > /dev/null
echo " Public Routing Matrix Associated."

# B. Private Table Custom Assembly
PRIVATE_RT_ID=$(aws ec2 create-route-table \
    --vpc-id "$VPC_ID" \
    --query 'RouteTable.RouteTableId' \
    --output text)

echo "⏳ Pausing for 15 seconds to let the NAT Gateway fabric state settle into an available pool..."
sleep 15

aws ec2 create-route --route-table-id "$PRIVATE_RT_ID" --destination-cidr-block 0.0.0.0/0 --gateway-id "$NAT_GW_ID" > /dev/null
aws ec2 associate-route-table --subnet-id "$PRIVATE_SUBNET_ID" --route-table-id "$PRIVATE_RT_ID" > /dev/null
echo " Private Routing Matrix Associated."

echo "========================================================================"
echo "🏆 ARCHITECTURAL AUTOMATION COMPLETE: WEEK 1 TOPOLOGY CAPTURED"
echo "========================================================================"
echo " VPC ID:              $VPC_ID"
echo " Public Subnet:       $PUBLIC_SUBNET_ID"
echo " Private Subnet:      $PRIVATE_SUBNET_ID"
echo " IGW Edge ID:         $IGW_ID"
echo " NAT Gateway ID:      $NAT_GW_ID"
echo "========================================================================"
