 /*
  * Copyright (c) Huawei Technologies Co., Ltd. 2021-2023. All rights reserved.
  * Description: Control interfaces of some virtual memory features in the general Linux system.
  * Author: Lei Run <leirun1@huawei.com>
  * Create: 2022-9-26
  */

#include <linux/mm.h>
#include <linux/module.h>
#include <linux/sysctl.h>

#ifdef CONFIG_SPLIT_SHRINKER
#include <linux/split_shrinker.h>
#endif

#if defined(CONFIG_TASK_PROTECT_LRU) || defined(CONFIG_MEMCG_PROTECT_LRU)
#include <linux/protect_lru.h>
#endif

#ifdef CONFIG_SPLIT_SHRINKER
static int one_hundred = 100;
#endif

#if !(defined(SYSCTL_ZERO) && defined(SYSCTL_ONE))
static int sysctl_vals[] = { 0, 1, INT_MAX };
#define SYSCTL_ZERO	((void *)&sysctl_vals[0])
#define SYSCTL_ONE	((void *)&sysctl_vals[1])
#define SYSCTL_INT_MAX	((void *)&sysctl_vals[2])
#endif

#ifdef CONFIG_SPLIT_SHRINKER
/*
 * Don't shrink delay_shrinkers unless reclaim prio is less than 8
 */
static int g_delay_shrinker_prio = 100;
int get_delay_shrinker_prio(void)
{
	return g_delay_shrinker_prio;
}

static int g_shrinker_number_limit;
int get_shrinker_number_limit(void)
{
	return g_shrinker_number_limit;
}

static int g_shrinker_percent_limit;
int get_shrinker_percent_limit(void)
{
	return g_shrinker_percent_limit;
}

#ifdef CONFIG_SPLIT_SHRINKER_DEBUG
static int g_split_shrinker_enable = 1;
bool is_split_shrinker_enable(void)
{
	return g_split_shrinker_enable == 1;
}

static int g_enable_register_skip_shrinker;
bool is_debug_skip_shrinker_enable(void)
{
	return g_enable_register_skip_shrinker == 1;
}
#endif
#endif

int g_rmap_trylock_enable = 1;

static struct ctl_table vm_table[] = {
#ifdef CONFIG_SPLIT_SHRINKER
	{
		.procname	= "delay_shrinker_prio",
		.data		= &g_delay_shrinker_prio,
		.maxlen		= sizeof(g_delay_shrinker_prio),
		.mode		= 0644,
		.proc_handler	= proc_dointvec_minmax,
		.extra1		= SYSCTL_ZERO,
		.extra2		= &one_hundred,
	},
	{
		.procname	= "shrinker_number_limit",
		.data		= &g_shrinker_number_limit,
		.maxlen		= sizeof(g_shrinker_number_limit),
		.mode		= 0644,
		.proc_handler	= proc_dointvec_minmax,
		.extra1		= SYSCTL_ZERO,
		.extra2		= SYSCTL_INT_MAX,
	},
	{
		.procname	= "shrinker_percent_limit",
		.data		= &g_shrinker_percent_limit,
		.maxlen		= sizeof(g_shrinker_percent_limit),
		.mode		= 0644,
		.proc_handler	= proc_dointvec_minmax,
		.extra1		= SYSCTL_ZERO,
		.extra2		= SYSCTL_INT_MAX,
	},
#ifdef CONFIG_SPLIT_SHRINKER_DEBUG
	{
		.procname	= "enable_split_shrinker",
		.data		= &g_split_shrinker_enable,
		.maxlen		= sizeof(g_split_shrinker_enable),
		.mode		= 0644,
		.proc_handler	= split_shrinker_sysctl_handler,
		.extra1		= SYSCTL_ZERO,
		.extra2		= SYSCTL_ONE,
	},
	{
		.procname	= "enable_register_skip_shrinker",
		.data		= &g_enable_register_skip_shrinker,
		.maxlen		= sizeof(g_enable_register_skip_shrinker),
		.mode		= 0644,
		.proc_handler	= register_skip_shrinker_sysctl_handler,
		.extra1		= SYSCTL_ZERO,
		.extra2		= SYSCTL_ONE,
	},
#endif
#endif

#if defined(CONFIG_TASK_PROTECT_LRU) || defined(CONFIG_MEMCG_PROTECT_LRU)
	{
		.procname       = "protect_lru",
		.mode           = 0440,
		.child          = protect_lru_table,
	},
#endif
	{ }
};

static struct ctl_table sysctl_base_table[] = {
	{
		.procname	= "vm",
		.mode		= 0555,
		.child		= vm_table,
	},
	{ }
};

static int __init hw_mm_sysctl_init(void)
{
	register_sysctl_table(sysctl_base_table);
	return 0;
}
module_init(hw_mm_sysctl_init);
