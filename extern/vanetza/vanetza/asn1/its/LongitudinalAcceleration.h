/*
 * Generated by asn1c-0.9.29 (http://lionet.info/asn1c)
 * From ASN.1 module "ITS-Container"
 * 	found in "CDD_TS102894-2/v1.2.1/ITS-Container.asn"
 * 	`asn1c -fcompound-names -fincludes-quoted -no-gen-example`
 */

#ifndef	_LongitudinalAcceleration_H_
#define	_LongitudinalAcceleration_H_


#include "asn_application.h"

/* Including external dependencies */
#include "LongitudinalAccelerationValue.h"
#include "AccelerationConfidence.h"
#include "constr_SEQUENCE.h"

#ifdef __cplusplus
extern "C" {
#endif

/* LongitudinalAcceleration */
typedef struct LongitudinalAcceleration {
	LongitudinalAccelerationValue_t	 longitudinalAccelerationValue;
	AccelerationConfidence_t	 longitudinalAccelerationConfidence;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} LongitudinalAcceleration_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_LongitudinalAcceleration;
extern asn_SEQUENCE_specifics_t asn_SPC_LongitudinalAcceleration_specs_1;
extern asn_TYPE_member_t asn_MBR_LongitudinalAcceleration_1[2];

#ifdef __cplusplus
}
#endif

#endif	/* _LongitudinalAcceleration_H_ */
#include "asn_internal.h"
