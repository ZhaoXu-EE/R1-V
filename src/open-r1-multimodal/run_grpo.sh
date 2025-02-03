# cd src/open-r1-multimodal

export DEBUG_MODE="true"
export LOG_PATH="./debug_log_2b.txt"



torchrun --nproc_per_node="1" \
    --nnodes="1" \
    --node_rank="0" \
    --master_addr="127.0.0.1" \
    --master_port="12345" \
    src/open_r1/grpo.py \
    --output_dir "/home/xu/workspace/R1-V/output" \
    --model_name_or_path "/home/xu/workspace/R1-V/src/open-r1-multimodal/Qwen2-VL-2B-Instruct" \
    --dataset_name "leonardPKU/clevr_cogen_a_train" \
    --max_prompt_length 1024 \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 2 \
    --logging_steps 1 \
    --bf16 \
    --report_to wandb \
    --gradient_checkpointing false \
    --attn_implementation flash_attention_2 \
    --max_pixels 401408 \
    --num_train_epochs 2 \
    --run_name Qwen2-VL-2B-GRPO-CLEVR-70k \
    --save_steps 100 \
    --save_only_model true