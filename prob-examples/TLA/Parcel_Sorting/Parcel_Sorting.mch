MACHINE Parcel_Sorting
SETS
 ENUM = {p1,p2,p3,p4,noParcel,b1,b2,b3,noBaskets,free,busy}
CONSTANTS PPARCELS, PARCELS, Baskets, adr
PROPERTIES
 PPARCELS = {p1, p2, p3, p4, noParcel}
 & PARCELS = {p1, p2, p3, p4}
 & Baskets = {b1, b2, b3}
 & adr : POW(ENUM*ENUM)
 & adr : PARCELS --> Baskets
 & PARCELS /= {}
 & Baskets /= {}
 & PARCELS <: PPARCELS
 & PARCELS /= PPARCELS
 & noBaskets /: Baskets
DEFINITIONS
 SortingState == {free, busy};

 TypeInvariant == channel : Baskets \/ {noBaskets}
	 & sorting : SortingState
	 & pe : PPARCELS
	 & ready_to_sort : BOOL
	 & arrived : PARCELS --> Baskets \/ {noBaskets}
	 & sorted <: PARCELS;

 UNSORTED == PARCELS - sorted;

 NOPARCELS == PPARCELS - PARCELS;

 Invariant == (sorting = busy => channel = adr(pe))
	 & (sorting /= free => pe : PARCELS)
	 & (sorting = busy => ready_to_sort = FALSE)
	 & (ready_to_sort = TRUE => channel = adr(pe))
	 & (ready_to_sort = TRUE => pe : PARCELS);

VARIABLES channel, sorting, pe, sorted, arrived, ready_to_sort
INVARIANT
 channel : ENUM
 & sorting : ENUM
 & pe : ENUM
 & sorted : POW(ENUM)
 & arrived : POW(ENUM*ENUM)
 & ready_to_sort : BOOL
 & Invariant
 & TypeInvariant
INITIALISATION
 channel, sorting, pe, sorted, arrived, ready_to_sort:(channel = noBaskets
 & sorting = free
 & pe : NOPARCELS
 & arrived = %p.(p : PARCELS| noBaskets)
 & sorted = {}
 & ready_to_sort = FALSE)
OPERATIONS
 select_parcel_Op = ANY pe_n
	WHERE sorting = free
	 & pe : NOPARCELS
	 & #p.(p : UNSORTED & pe_n = p)
	 & TRUE = TRUE
	THEN pe := pe_n END;

 set_channel_Op = ANY channel_n, ready_to_sort_n
	WHERE sorting = free
	 & pe /: NOPARCELS
	 & ready_to_sort = FALSE
	 & channel_n = adr(pe)
	 & ready_to_sort_n = TRUE
	 & TRUE = TRUE
	THEN channel, ready_to_sort := channel_n, ready_to_sort_n END;

 release_Op = ANY sorting_n, ready_to_sort_n
	WHERE ready_to_sort = TRUE
	 & (sorting = free & pe : PARCELS)
	 & sorting_n = busy
	 & ready_to_sort_n = FALSE
	 & TRUE = TRUE
	THEN sorting, ready_to_sort := sorting_n, ready_to_sort_n END;

 cross_parcel_Op = ANY sorting_n, pe_n, sorted_n, arrived_n
	WHERE sorting = busy
	 & arrived_n = arrived <+ {pe |-> channel}
	 & sorted_n = sorted \/ {pe}
	 & pe_n : NOPARCELS
	 & sorting_n = free
	 & TRUE = TRUE
	THEN sorting, pe, sorted, arrived := sorting_n, pe_n, sorted_n, arrived_n END
END
/* Created Thu Dec 15 13:29:27 CET 2011 by TLA2B */